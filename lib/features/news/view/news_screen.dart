import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/features/news/bloc/news_bloc/news_bloc.dart';

import 'package:forestvpn_test/features/news/widgets/widgets.dart';
import 'package:forestvpn_test/utils/utils.dart';

@RoutePage()
class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final _newsBloc = G<NewsBloc>();

  @override
  void initState() {
    _newsBloc.add(const LoadNews());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          TextButton(
            onPressed: () => _newsBloc.add(const MarkAllNewsRead()),
            child: Text(
              'Mark all read',
              style: theme.textTheme.labelLarge,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<NewsBloc, NewsState>(
          bloc: _newsBloc,
          builder: (context, state) {
            if (state is LoadedNews) {
              final listFeaturedArticles = state.listFeaturedArticles;
              final latestNews = state.listLatestNews;
              return BodyNewsWidget(
                featured: listFeaturedArticles,
                latestNews: latestNews,
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
