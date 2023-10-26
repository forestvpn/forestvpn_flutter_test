import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:forestvpn_test/repositories/news/repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({
    required AbstractNewsRepository abstractNewsRepository,
  })  : _abstractNewsRepository = abstractNewsRepository,
        super(NewsInitial()) {
    on<LoadNews>(_loadNews);
    on<MarkAllNewsRead>(_markAllNewsRead);
    on<MarkOneNewsRead>(_markOneNewsRead);
  }

  final AbstractNewsRepository _abstractNewsRepository;

  List<Article> listLatestNews = [];
  List<Article> listFeaturedArticles = [];

  Future<void> _loadNews(
    LoadNews event,
    Emitter<NewsState> emit,
  ) async {
    emit(const LoadingNews());

    try {
      listFeaturedArticles =
          await _abstractNewsRepository.getFeaturedArticles();
      listLatestNews = await _abstractNewsRepository.getLatestArticles();

      listFeaturedArticles = await updateArticlesList(listFeaturedArticles);
      listLatestNews = await updateArticlesList(listLatestNews);

      emit(
        LoadedNews(
          listFeaturedArticles: listFeaturedArticles,
          listLatestNews: listLatestNews,
        ),
      );
    } catch (e) {
      emit(ErrorState(error: e));
    }
  }

  void _markAllNewsRead(
    MarkAllNewsRead event,
    Emitter<NewsState> emit,
  ) {
    listLatestNews = listLatestNews.map((element) {
      return Article(
        imageUrl: element.imageUrl,
        id: element.id,
        title: element.title,
        publicationDate: element.publicationDate,
        readed: true,
        description: element.description,
      );
    }).toList();

    emit(LoadedNews(
      listFeaturedArticles: listFeaturedArticles,
      listLatestNews: listLatestNews,
    ));
  }

  void _markOneNewsRead(
    MarkOneNewsRead event,
    Emitter<NewsState> emit,
  ) {
    final String newsId = event.newsID;

    listLatestNews = listLatestNews.map((element) {
      if (element.id == newsId) {
        return Article(
          imageUrl: element.imageUrl,
          id: element.id,
          title: element.title,
          publicationDate: element.publicationDate,
          readed: true,
          description: element.description,
        );
      }
      return element;
    }).toList();

    emit(LoadedNews(
      listFeaturedArticles: listFeaturedArticles,
      listLatestNews: listLatestNews,
    ));
  }

  Future<List<Article>> updateArticlesList(List<Article> articlesList) async {
    List<Article> updatedArticlesList = [];

    await Future.forEach(articlesList, (Article element) async {
      final imageUrl =
          await _abstractNewsRepository.extractDirectImageUrl(element.imageUrl);

      Article updatedArticle = Article(
        imageUrl: imageUrl ?? element.imageUrl,
        id: element.id,
        title: element.title,
        publicationDate: element.publicationDate,
        readed: element.readed,
        description: element.description,
      );

      updatedArticlesList.add(updatedArticle);
    });

    return updatedArticlesList;
  }
}
