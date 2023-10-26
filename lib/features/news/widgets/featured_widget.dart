import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:forestvpn_test/repositories/news/repository.dart';
import 'package:forestvpn_test/utils/auto_route/router.dart';

class FeaturedWidget extends StatelessWidget {
  final Article article;
  const FeaturedWidget({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Image.network(
            article.imageUrl,
            height: 300,
            width: MediaQuery.of(context).size.width - 28 - 28,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 20,
            top: 218,
            child: SizedBox(
              width: 270,
              height: 66,
              child: Text(
                article.title,
                style: theme.textTheme.bodyMedium,
                maxLines: 2,
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                _pushOneNewsScreenRoute(
                  context: context,
                  id: article.id,
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width - 28 - 28,
              ),
            ),
          )
        ],
      ),
    );
  }
}

void _pushOneNewsScreenRoute({
  required BuildContext context,
  required String id,
}) {
  AutoRouter.of(context).push(
    OneNewsScreenRoute(
      newsID: id,
    ),
  );
}
