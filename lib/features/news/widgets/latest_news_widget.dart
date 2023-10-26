import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:forestvpn_test/features/news/bloc/news_bloc/news_bloc.dart';

import 'package:forestvpn_test/repositories/news/repository.dart';
import 'package:forestvpn_test/utils/auto_route/router.dart';
import 'package:forestvpn_test/utils/utils.dart';

class LatestNewsWidget extends StatelessWidget {
  const LatestNewsWidget({
    Key? key,
    required this.latestNews,
  }) : super(key: key);
  final Article latestNews;
  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Theme.of(context).canvasColor;
    final theme = Theme.of(context);
    final _newsBloc = G<NewsBloc>();
    return SizedBox(
      height: 103,
      child: Card(
        color: latestNews.readed ? backgroundColor : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
        child: InkWell(
          onTap: () => _pushOneNewsScreenRoute(
            context: context,
            id: latestNews.id,
            newsBloc: _newsBloc,
          ),
          child: Center(
            child: Container(
              height: 60,
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      latestNews.imageUrl,
                      height: 60,
                      width: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 23),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 190,
                          height: 38,
                          child: Text(
                            latestNews.title,
                            style: theme.textTheme.bodySmall,
                            maxLines: 2,
                          ),
                        ),
                        Text(
                          formatPublicationDate(latestNews.publicationDate),
                          style: theme.textTheme.titleSmall,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String formatPublicationDate(DateTime publicationDate) {
  final now = DateTime.now();
  final difference = now.difference(publicationDate);

  if (difference.inDays > 1) {
    return '${difference.inDays} days ago';
  } else if (difference.inDays == 1) {
    return '1 day ago';
  } else if (difference.inHours > 1) {
    return '${difference.inHours} hours ago';
  } else if (difference.inHours == 1) {
    return '1 hour ago';
  } else if (difference.inMinutes > 1) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inMinutes == 1 || difference.inMinutes == 0) {
    return '1 minute ago';
  } else {
    return 'Just now';
  }
}

void _pushOneNewsScreenRoute({
  required NewsBloc newsBloc,
  required BuildContext context,
  required String id,
}) {
  newsBloc.add(MarkOneNewsRead(newsID: id));
  AutoRouter.of(context).push(
    OneNewsScreenRoute(
      newsID: id,
    ),
  );
}
