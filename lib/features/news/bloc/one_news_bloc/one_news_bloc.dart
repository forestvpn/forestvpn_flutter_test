import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forestvpn_test/repositories/news/repository.dart';

part 'one_news_event.dart';
part 'one_news_state.dart';

class OneNewsBloc extends Bloc<OneNewsEvent, OneNewsState> {
  OneNewsBloc({
    required AbstractNewsRepository abstractNewsRepository,
  })  : _abstractNewsRepository = abstractNewsRepository,
        super(OneNewsInitial()) {
    on<LoadOneNews>(_loadOneNews);
  }

  Future<void> _loadOneNews(
    LoadOneNews event,
    Emitter<OneNewsState> emit,
  ) async {
    final newsId = event.newsId;

    try {
      emit(const LoadingNews());
      Article oneNews = await _abstractNewsRepository.getArticle(newsId);
      oneNews = await updateArticlesList(oneNews);
      emit(LoadedNews(oneNews: oneNews));
    } catch (e) {
      emit(ErrorState(error: e));
    }
  }

  final AbstractNewsRepository _abstractNewsRepository;

  Future<Article> updateArticlesList(Article oneNews) async {
    Article updatedArticle;

    final imageUrl =
        await _abstractNewsRepository.extractDirectImageUrl(oneNews.imageUrl);

    updatedArticle = Article(
      imageUrl: imageUrl ?? oneNews.imageUrl,
      id: oneNews.id,
      title: oneNews.title,
      publicationDate: oneNews.publicationDate,
      readed: oneNews.readed,
      description: oneNews.description,
    );

    return updatedArticle;
  }
}
