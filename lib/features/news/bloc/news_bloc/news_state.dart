part of 'news_bloc.dart';

@immutable
abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsInitial extends NewsState {
  @override
  List<Object?> get props => [];
}

class LoadingNews extends NewsState {
  const LoadingNews();
  @override
  List<Object?> get props => [];
}

class LoadedNews extends NewsState {
  const LoadedNews({
    required this.listFeaturedArticles,
    required this.listLatestNews,
  });
  final List<Article> listFeaturedArticles;
  final List<Article> listLatestNews;

  @override
  List<Object?> get props => [listFeaturedArticles, listLatestNews];
}

class ErrorState extends NewsState {
  const ErrorState({
    required this.error,
  });
  final Object error;

  @override
  List<Object?> get props => [error];
}
