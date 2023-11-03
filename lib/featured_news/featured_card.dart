import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../article/article_page.dart';
import '../latest_news/cubit/latest_news_list_cubit.dart';
import '../repositories/news/models/models.dart';
import '../theme.dart';
import '../widgets/translucent_background.dart';

class FeaturedCard extends StatelessWidget {
  final Article article;

  const FeaturedCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () {
        Navigator.of(context).push(ArticlePage.route(article.id));
        context.read<LatestNewsListCubit>().markArticleAsRead(article.id);
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 55,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  constraints: const BoxConstraints.expand(),
                  child: Image.network(
                    article.imageUrl,
                    errorBuilder: (_, __, ___) => Center(
                      child: Icon(
                        Icons.error,
                        color: theme.colorScheme.error,
                      ),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 48,
                ),
                child: TranslucentBackground(
                  child: Text(
                    article.title,
                    style: AppTheme.cardHeadlineTextStyle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
