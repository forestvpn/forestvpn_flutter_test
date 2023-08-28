part of 'get_one_new_bloc.dart';

@immutable
abstract class GetOneNewState {}

class GetOneNewInitial extends GetOneNewState {}

class GetOneNewLoading extends GetOneNewState {}

class GetOneNewSuccess extends GetOneNewState {}

class GetOneNewError extends GetOneNewState {}
