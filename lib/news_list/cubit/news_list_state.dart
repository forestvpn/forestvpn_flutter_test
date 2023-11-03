part of 'news_list_cubit.dart';

@immutable
class NewsListState {}

class NewsListInitial extends NewsListState {}

class NewsListLoading extends NewsListState {}

class NewsListLoaded extends NewsListState {
  final List<Article> articles;

  NewsListLoaded(this.articles);
}

class NewsListError extends NewsListState {}
