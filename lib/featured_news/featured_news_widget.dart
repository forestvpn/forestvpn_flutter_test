import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/repositories/news/abstract_news_repository.dart';

import '../widgets/featured_card.dart';
import 'cubit/featured_news_list_cubit.dart';

class FeaturedNewsWidget extends StatelessWidget {
  const FeaturedNewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FeaturedNewsListCubit(context.read<AbstractNewsRepository>()),
      child: const _FeaturedNewsView(),
    );
  }
}

class _FeaturedNewsView extends StatelessWidget {
  const _FeaturedNewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedNewsListCubit, FeaturedNewsListState>(
      builder: (context, state) {
        if (state is FeaturedNewsListInitial ||
            state is FeaturedNewsListLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is FeaturedNewsListLoaded) {
          return ListView(
            scrollDirection: Axis.horizontal,
            children: state.articles
                .map((article) => FeaturedCard(article: article))
                .toList(),
          );
        }

        return const Center(child: Text('Error'));
      },
    );
  }
}
