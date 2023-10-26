import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:forestvpn_test/repositories/news/repository.dart';

class OneNewsWidget extends StatelessWidget {
  const OneNewsWidget({
    Key? key,
    required this.oneNews,
  }) : super(key: key);
  final Article oneNews;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final String imageUrl = oneNews.imageUrl;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 495,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  ),
                  Positioned(
                    left: 48,
                    top: 389,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        oneNews.title,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                AutoRouter.of(context).pop();
              },
            ),
            stretch: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 20),
              child: Text(
                (oneNews.description ?? 'This article has no text')
                    .replaceAll(RegExp(r'(?<=[.!?])\s'), '\n\n'),
                style: theme.textTheme.titleMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
