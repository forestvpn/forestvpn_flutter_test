import 'package:flutter/material.dart';
import 'package:forestvpn_test/featured_news/featured_news_widget.dart';
import 'package:forestvpn_test/news_list/latest_news_widget.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          TextButton(
            child: Text(
              'Mark all as read',
              style: theme.appBarTheme.titleTextStyle,
            ),
            onPressed: () {},
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
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: const FeaturedNewsWidget(),
            ),
            const SizedBox(height: 20),
            Text(
              'Latest news',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            const LatestNewsWidget(),
          ],
        ),
      ),
    );
  }
}
