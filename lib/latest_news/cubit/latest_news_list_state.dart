part of 'latest_news_list_cubit.dart';

@immutable
class LatestNewsListState {}

class LatestNewsListInitial extends LatestNewsListState {}

class LatestNewsListLoading extends LatestNewsListState {}

class LatestNewsListLoaded extends LatestNewsListState {
  final List<Article> articles;

  LatestNewsListLoaded(this.articles);
}

class LatestNewsListError extends LatestNewsListState {}
