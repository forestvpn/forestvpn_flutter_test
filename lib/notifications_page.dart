import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/featured_news/featured_news_widget.dart';
import 'package:forestvpn_test/news_list/latest_news_widget.dart';

import 'news_list/cubit/news_list_cubit.dart';
import 'repositories/news/repository.dart';
import 'theme.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) =>
          NewsListCubit(context.read<AbstractNewsRepository>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notifications',
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          actions: [
            Builder(
              builder: (context) => TextButton(
                child: Text(
                  'Mark all as read',
                  style: theme.appBarTheme.titleTextStyle,
                ),
                onPressed: () =>
                    context.read<NewsListCubit>().markAllArticlesAsRead(),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: ListView(
            children: [
              Text(
                'Featured',
                style: theme.textTheme.titleLarge,
              ),
              AppTheme.verticalSpacing,
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: const FeaturedNewsWidget(),
              ),
              AppTheme.verticalSpacing,
              Text(
                'Latest news',
                style: theme.textTheme.titleLarge,
              ),
              AppTheme.verticalSpacing,
              const LatestNewsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
