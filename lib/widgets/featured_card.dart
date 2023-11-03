import 'package:flutter/material.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';

class FeaturedCard extends StatelessWidget {
  final Article article;

  const FeaturedCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: GestureDetector(
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 65,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              fit: StackFit.expand,
              alignment: AlignmentDirectional.topEnd,
              children: [
                Image.network(
                  article.imageUrl,
                  errorBuilder: (_, __, ___) => Center(
                    child: Icon(
                      Icons.error,
                      color: theme.colorScheme.error,
                    ),
                  ),
                  fit: BoxFit.cover,
                ),
                Text(
                  article.title,
                  style: theme.textTheme.headlineSmall
                      ?.copyWith(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
