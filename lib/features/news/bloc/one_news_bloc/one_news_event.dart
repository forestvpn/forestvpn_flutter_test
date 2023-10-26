// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'one_news_bloc.dart';

abstract class OneNewsEvent extends Equatable {
  const OneNewsEvent();
}

class LoadOneNews extends OneNewsEvent {
  const LoadOneNews({
    required this.newsId,
  });
  final String newsId;
  @override
  List<Object?> get props => [newsId];
}
