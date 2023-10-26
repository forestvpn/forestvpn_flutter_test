import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/features/news/bloc/one_news_bloc/one_news_bloc.dart';

import 'package:forestvpn_test/features/news/widgets/widgets.dart';
import 'package:forestvpn_test/utils/utils.dart';

@RoutePage()
class OneNewsScreen extends StatefulWidget {
  const OneNewsScreen({
    Key? key,
    required this.newsID,
  }) : super(key: key);
  final String newsID;

  @override
  State<OneNewsScreen> createState() => _OneNewsScreenState();
}

class _OneNewsScreenState extends State<OneNewsScreen> {
  final _oneNewsBloc = G<OneNewsBloc>();
  @override
  void initState() {
    _oneNewsBloc.add(LoadOneNews(newsId: widget.newsID));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OneNewsBloc, OneNewsState>(
      bloc: _oneNewsBloc,
      builder: (context, state) {
        if (state is LoadedNews) {
          final oneNews = state.oneNews;
          return OneNewsWidget(
            oneNews: oneNews,
          );
        }
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
