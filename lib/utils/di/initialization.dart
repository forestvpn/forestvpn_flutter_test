import 'package:forestvpn_test/features/news/bloc/news_bloc/news_bloc.dart';
import 'package:forestvpn_test/features/news/bloc/one_news_bloc/one_news_bloc.dart';
import 'package:forestvpn_test/repositories/news/repository.dart';

import 'di.dart';

Future<void> initializaeBeforeAppStart() async {
  final abstractNewsRepository = MockNewsRepository();

  G.registerLazySingleton(
    () => NewsBloc(abstractNewsRepository: abstractNewsRepository),
  );

  G.registerFactory(
    () => OneNewsBloc(abstractNewsRepository: abstractNewsRepository),
  );
}
