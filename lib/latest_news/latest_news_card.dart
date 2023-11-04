import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../article/article_page.dart';
import '../repositories/news/repository.dart';
import '../utils/published_date_string.dart';
import 'cubit/latest_news_list_cubit.dart';

class LatestNewsCard extends StatelessWidget {
  final Article article;

  const LatestNewsCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: MediaQuery.of(context).size.height / 8,
      child: Card(
        color: article.readed
            ? const Color(0xFFF5F5F5)
            : theme.colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(ArticlePage.route(article.id));
            context.read<LatestNewsListCubit>().markArticleAsRead(article.id);
          },
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, top: 20, bottom: 23, right: 35),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: _ArticleImage(url: article.imageUrl),
                ),
                const SizedBox(width: 23),
                Flexible(
                    flex: 2,
                    child: _ArticleTitleAndDate(
                      title: article.title,
                      date: article.publicationDate,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ArticleImage extends StatelessWidget {
  final String url;
  const _ArticleImage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        constraints: const BoxConstraints.expand(),
        child: Image.network(
          url,
          fit: BoxFit.fill,
          errorBuilder: (_, __, ___) => Center(
            child: Icon(
              Icons.error,
              color: theme.colorScheme.error,
            ),
          ),
        ),
      ),
    );
  }
}

class _ArticleTitleAndDate extends StatelessWidget {
  final String title;
  final DateTime date;

  const _ArticleTitleAndDate({
    Key? key,
    required this.title,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          title,
          style: theme.textTheme.bodyLarge,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          publishedDateString(date),
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }
}
