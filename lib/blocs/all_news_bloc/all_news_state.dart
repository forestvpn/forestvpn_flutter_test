part of 'all_news_bloc.dart';

@immutable
abstract class AllNewsState {}

class AllNewsInitial extends AllNewsState {}

class AllNewsLoading extends AllNewsState {}

class AllNewsSuccess extends AllNewsState {}

class AllNewsError extends AllNewsState {}