import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../repositories/news/abstract_news_repository.dart';
import '../../repositories/news/models/article.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  final AbstractNewsRepository newsRepository;
  final String articleId;

  ArticleCubit({required this.newsRepository, required this.articleId})
      : super(ArticleInitial()) {
    fetchArticle(articleId);
  }

  Future<void> fetchArticle(String articleId) async {
    if (articleId.isEmpty) {
      emit(ArticleError());
      return;
    }

    emit(ArticleLoading());

    try {
      final articles = await newsRepository.getArticle(articleId);

      emit(ArticleLoaded(articles));
    } on Exception {
      emit(ArticleError());
    }
  }
}
