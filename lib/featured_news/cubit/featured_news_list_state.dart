part of 'featured_news_list_cubit.dart';

@immutable
class FeaturedNewsListState {}

class FeaturedNewsListLoading extends FeaturedNewsListState {}

class FeaturedNewsListLoaded extends FeaturedNewsListState {
  final List<Article> articles;

  FeaturedNewsListLoaded(this.articles);
}

class FeaturedNewsListError extends FeaturedNewsListState {}
