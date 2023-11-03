import 'package:bloc/bloc.dart';
import 'package:forestvpn_test/repositories/news/repository.dart';
import 'package:meta/meta.dart';

part 'news_list_state.dart';

class NewsListCubit extends Cubit<NewsListState> {
  final AbstractNewsRepository _newsRepository;

  NewsListCubit(this._newsRepository) : super(NewsListInitial()) {
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    emit(NewsListLoading());

    try {
      final articles = await _newsRepository.getFeaturedArticles();

      emit(NewsListLoaded(articles));
    } on Exception {
      emit(NewsListError());
    }
  }

  Future<void> markArticleAsRead(String articleId) async {
    try {
      await _newsRepository.readArticle(articleId);

      await fetchArticles();
    } on Exception {
      return;
    }
  }
}
