import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/latest_news/latest_news_card.dart';

import '../repositories/news/repository.dart';
import 'cubit/featured_news_list_cubit.dart';
import 'featured_card.dart';

class FeaturedNewsWidget extends StatelessWidget {
  const FeaturedNewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FeaturedNewsListCubit(context.read<AbstractNewsRepository>()),
      child: SliverPersistentHeader(
        delegate: _FeaturedNewsSliverHeaderDelegate(
          expandedHeight: MediaQuery.of(context).size.height / 3,
          collapsedHeight: MediaQuery.of(context).size.height / 8,
        ),
      ),
    );
  }
}

class _FeaturedNewsSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double collapsedHeight;

  _FeaturedNewsSliverHeaderDelegate({
    required this.expandedHeight,
    required this.collapsedHeight,
  });

  @override
  double get minExtent => collapsedHeight;

  @override
  double get maxExtent => expandedHeight;

  int _openArticleIndex = 0;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return BlocBuilder<FeaturedNewsListCubit, FeaturedNewsListState>(
      builder: (context, state) {
        if (state is FeaturedNewsListInitial ||
            state is FeaturedNewsListLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is FeaturedNewsListLoaded) {
          final threshold = (maxExtent - minExtent) / 2 + minExtent * 0.8;

          final childToShow = shrinkOffset > threshold
              ? LatestNewsCard(article: state.articles[_openArticleIndex])
              : _FeaturedNewsCarousel(
                  initialPageIndex: _openArticleIndex,
                  articles: state.articles,
                  onPageChanged: (index) => _openArticleIndex = index,
                );

          return childToShow;
        }

        return const Center(child: Text('Error'));
      },
    );
  }

  @override
  bool shouldRebuild(_FeaturedNewsSliverHeaderDelegate oldDelegate) {
    return expandedHeight != oldDelegate.expandedHeight ||
        collapsedHeight != oldDelegate.collapsedHeight;
  }
}

class _FeaturedNewsCarousel extends StatelessWidget {
  final int initialPageIndex;
  final List<Article> articles;
  final void Function(int) onPageChanged;

  const _FeaturedNewsCarousel({
    Key? key,
    required this.initialPageIndex,
    required this.articles,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: PageController(initialPage: initialPageIndex),
      onPageChanged: onPageChanged,
      children:
          articles.map((article) => FeaturedCard(article: article)).toList(),
    );
  }
}
