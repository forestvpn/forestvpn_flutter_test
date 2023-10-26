part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class LoadNews extends NewsEvent {
  const LoadNews();
  @override
  List<Object?> get props => [];
}

class MarkAllNewsRead extends NewsEvent {
  const MarkAllNewsRead();

  @override
  List<Object?> get props => [];
}

class MarkOneNewsRead extends NewsEvent {
  const MarkOneNewsRead({
    required this.newsID,
  });
  final String newsID;
  @override
  List<Object?> get props => [newsID];
}
