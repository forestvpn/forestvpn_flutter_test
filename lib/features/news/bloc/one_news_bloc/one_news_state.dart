part of 'one_news_bloc.dart';

abstract class OneNewsState extends Equatable {
  const OneNewsState();
}

class OneNewsInitial extends OneNewsState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends OneNewsState {
  const ErrorState({
    required this.error,
  });
  final Object error;

  @override
  List<Object?> get props => [error];
}

class LoadingNews extends OneNewsState {
  const LoadingNews();
  @override
  List<Object?> get props => [];
}

class LoadedNews extends OneNewsState {
  const LoadedNews({
    required this.oneNews,
  });
  final Article oneNews;

  @override
  List<Object?> get props => [oneNews];
}
