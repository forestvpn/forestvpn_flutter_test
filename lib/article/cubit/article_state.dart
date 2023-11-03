part of 'article_cubit.dart';

@immutable
class ArticleState {}

class ArticleInitial extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticleLoaded extends ArticleState {
  final Article article;

  ArticleLoaded(this.article);
}

class ArticleError extends ArticleState {}
