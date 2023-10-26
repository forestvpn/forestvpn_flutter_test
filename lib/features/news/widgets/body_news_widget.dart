import 'package:flutter/material.dart';
import 'package:forestvpn_test/features/news/widgets/widgets.dart';

import 'package:forestvpn_test/repositories/news/repository.dart';

class BodyNewsWidget extends StatelessWidget {
  const BodyNewsWidget({
    Key? key,
    required this.featured,
    required this.latestNews,
  }) : super(key: key);
  final List<Article> featured;
  final List<Article> latestNews;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(28, 32.8, 28, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Featured', style: theme.textTheme.bodyLarge),
          Container(
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            height: 300,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) =>
                  FeaturedWidget(article: featured[index]),
              itemCount: featured.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 20),
            ),
          ),
          const SizedBox(height: 20),
          Text('Latest news', style: theme.textTheme.bodyLarge),
          ListView.separated(
            padding: const EdgeInsets.only(top: 20),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: latestNews.length,
            itemBuilder: (BuildContext context, int index) =>
                LatestNewsWidget(latestNews: latestNews[index]),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 10),
          ),
        ],
      ),
    );
  }
}
