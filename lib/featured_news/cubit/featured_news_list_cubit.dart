import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../repositories/news/abstract_news_repository.dart';
import '../../repositories/news/models/article.dart';

part 'featured_news_list_state.dart';

class FeaturedNewsListCubit extends Cubit<FeaturedNewsListState> {
  final AbstractNewsRepository _newsRepository;

  FeaturedNewsListCubit(this._newsRepository)
      : super(FeaturedNewsListInitial()) {
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    emit(FeaturedNewsListLoading());

    try {
      final articles = await _newsRepository.getFeaturedArticles();

      emit(FeaturedNewsListLoaded(articles));
    } on Exception {
      emit(FeaturedNewsListError());
    }
  }
}
