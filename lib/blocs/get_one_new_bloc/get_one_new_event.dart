part of 'get_one_new_bloc.dart';

@immutable
abstract class GetOneNewEvent {}

class GettingOneNewEvent extends GetOneNewEvent {
  GettingOneNewEvent({required this.articleId});

  final String articleId;
}