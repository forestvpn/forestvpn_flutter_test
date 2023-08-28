import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:forestvpn_test/repositories/news/mock_news_repository.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'package:meta/meta.dart';

part 'all_news_event.dart';
part 'all_news_state.dart';

class AllNewsBloc extends Bloc<AllNewsEvent, AllNewsState> {
  AllNewsBloc() : super(AllNewsInitial()) {

    on<GettingAllArticlesEvent>(getAllArticlesEvent);
    on<ReadAllArticlesEvent>(readAllArticles);
  }

  MockNewsRepository mockNewsRepository = MockNewsRepository();

  List<Article> latestArticles = [];
  List<Article> featuredArticles = [];

  bool dataUploaded = false;

  void getAllArticlesEvent(GettingAllArticlesEvent event, Emitter<AllNewsState> emit) async {
    emit(AllNewsLoading());
    latestArticles = await mockNewsRepository.getLatestArticles();
    featuredArticles = await mockNewsRepository.getFeaturedArticles();
    if (latestArticles.isNotEmpty && featuredArticles.isNotEmpty) {
      dataUploaded = true;
      emit(AllNewsSuccess());
    } else {
      emit(AllNewsError());
    }
  }

  bool loading = false;

  void readAllArticles(ReadAllArticlesEvent event, Emitter<AllNewsState> emit) async {
    loading = true;
    emit(AllNewsSuccess());
    for (var item in latestArticles) {
      item.readed = true;
    }
    for (var item in featuredArticles) {
      item.readed = true;
    }
    await Future.delayed(const Duration(seconds: 1));
    loading = false;
    emit(AllNewsSuccess());
  }
}