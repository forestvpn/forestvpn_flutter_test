import 'package:flutter/material.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';

import '../article_page.dart';
import '../utils/published_date_string.dart';

class LatestNewsCard extends StatelessWidget {
  final Article article;

  const LatestNewsCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9),
      ),
      child: InkWell(
        onTap: () => Navigator.of(context).push(ArticlePage.route(article.id)),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 9,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, top: 20, bottom: 23, right: 35),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      article.imageUrl,
                      errorBuilder: (_, __, ___) => Center(
                        child: Icon(
                          Icons.error,
                          color: theme.colorScheme.error,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 23),
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        article.title,
                        style: theme.textTheme.bodyLarge,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        publishedDateString(article.publicationDate),
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
