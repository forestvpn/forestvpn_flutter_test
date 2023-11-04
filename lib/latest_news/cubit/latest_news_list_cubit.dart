import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../repositories/news/repository.dart';

part 'latest_news_list_state.dart';

class LatestNewsListCubit extends Cubit<LatestNewsListState> {
  final AbstractNewsRepository _newsRepository;

  LatestNewsListCubit(this._newsRepository) : super(LatestNewsListLoading()) {
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    emit(LatestNewsListLoading());

    try {
      final articles = await _newsRepository.getLatestArticles();

      emit(LatestNewsListLoaded(articles));
    } on Exception {
      emit(LatestNewsListError());
    }
  }

  Future<void> markArticleAsRead(String articleId) async {
    try {
      await _newsRepository.markArticleAsRead(articleId);

      await fetchArticles();
    } on Exception {
      return;
    }
  }

  Future<void> markAllArticlesAsRead() async {
    await _newsRepository.markAllArticlesAsRead();

    await fetchArticles();
  }
}
