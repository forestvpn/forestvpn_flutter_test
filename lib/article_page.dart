import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/article/cubit/article_cubit.dart';
import 'package:forestvpn_test/repositories/news/abstract_news_repository.dart';

import 'repositories/news/models/article.dart';
import 'widgets/translucent_background.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage._();

  static Route<void> route(String articleId) {
    return MaterialPageRoute<void>(
      builder: (context) {
        final articleCubit = ArticleCubit(
          newsRepository: context.read<AbstractNewsRepository>(),
          articleId: articleId,
        );

        return BlocProvider.value(
          value: articleCubit,
          child: const ArticlePage._(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocBuilder<ArticleCubit, ArticleState>(
        builder: (context, state) {
          if (state is ArticleInitial || state is ArticleLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ArticleLoaded) {
            final theme = Theme.of(context);

            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _ArticleHeaderWidget(article: state.article),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 21),
                        child: Text(
                          state.article.description ?? '',
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                Positioned(
                  top: 64,
                  child: IconButton(
                    icon: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(2),
                      alignment: Alignment.centerRight,
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                    splashRadius: 2,
                    color: Colors.white,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            );
          }

          return const Text('Error');
        },
      ),
    );
  }
}

class _ArticleHeaderWidget extends StatelessWidget {
  final Article article;

  const _ArticleHeaderWidget({Key? key, required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      elevation: 5,
      shadowColor: Colors.black.withOpacity(0.7),
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2,
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
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 48),
            child: TranslucentBackground(
              child: Text(
                article.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.headlineSmall
                    ?.copyWith(color: Colors.white, fontSize: 28),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
