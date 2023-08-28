part of 'all_news_bloc.dart';

@immutable
abstract class AllNewsEvent {}

class GettingAllArticlesEvent extends AllNewsEvent {}

class ReadAllArticlesEvent extends AllNewsEvent {}