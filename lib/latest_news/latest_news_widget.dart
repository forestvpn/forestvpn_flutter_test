import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme.dart';
import 'cubit/latest_news_list_cubit.dart';
import 'latest_news_card.dart';

class LatestNewsWidget extends StatelessWidget {
  const LatestNewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LatestNewsListCubit, LatestNewsListState>(
      builder: (context, state) {
        if (state is LatestNewsListInitial || state is LatestNewsListLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is LatestNewsListLoaded) {
          return Column(
              children: state.articles
                  .expand((article) => [
                        LatestNewsCard(article: article),
                        AppTheme.verticalSpacing,
                      ])
                  .toList());
        }

        return const Center(child: Text('Error'));
      },
    );
  }
}
