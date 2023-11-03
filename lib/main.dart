import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'news/news_page.dart';
import 'repositories/news/repository.dart';
import 'theme.dart';

void main() {
  final _mockNewsRepository = MockNewsRepository();

  runApp(
    ForestVPNTestApp(newsRepository: _mockNewsRepository),
  );
}

class ForestVPNTestApp extends StatelessWidget {
  final AbstractNewsRepository newsRepository;

  const ForestVPNTestApp({Key? key, required this.newsRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: newsRepository,
      child: MaterialApp(
        title: 'ForestVPN test',
        theme: AppTheme.lightTheme(),
        home: const NewsPage(),
      ),
    );
  }
}
