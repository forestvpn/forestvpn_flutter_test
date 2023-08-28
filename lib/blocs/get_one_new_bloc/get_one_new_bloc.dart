import 'package:bloc/bloc.dart';
import 'package:forestvpn_test/repositories/news/mock_news_repository.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'package:meta/meta.dart';

part 'get_one_new_event.dart';
part 'get_one_new_state.dart';

class GetOneNewBloc extends Bloc<GetOneNewEvent, GetOneNewState> {
  GetOneNewBloc() : super(GetOneNewInitial()) {
    on<GettingOneNewEvent>(gettingOneNew);
  }

  MockNewsRepository mockNewsRepository = MockNewsRepository();

  Article? article;

  void gettingOneNew(GettingOneNewEvent event, Emitter<GetOneNewState> emit) async {
    emit(GetOneNewLoading());
    article = await mockNewsRepository.getArticle(event.articleId);
    if (article != null) {
      emit(GetOneNewSuccess());
    } else {
      emit(GetOneNewError());
    }
  }
}
