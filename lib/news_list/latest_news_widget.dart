import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/repositories/news/abstract_news_repository.dart';

import '../widgets/latest_news_card.dart';
import 'cubit/news_list_cubit.dart';

class LatestNewsWidget extends StatelessWidget {
  const LatestNewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewsListCubit(context.read<AbstractNewsRepository>()),
      child: const _LatestNewsView(),
    );
  }
}

class _LatestNewsView extends StatelessWidget {
  const _LatestNewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsListCubit, NewsListState>(
      builder: (context, state) {
        if (state is NewsListInitial || state is NewsListLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is NewsListLoaded) {
          return Column(
              children: state.articles
                  .expand((article) => [
                        LatestNewsCard(article: article),
                        const SizedBox(height: 20),
                      ])
                  .toList());
        }

        return const Center(child: Text('Error'));
      },
    );
  }
}
