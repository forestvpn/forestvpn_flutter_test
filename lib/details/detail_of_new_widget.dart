import 'package:flutter/material.dart';

import 'detail_of_new_widget_info.dart';

class DetailOfNewWidget extends StatefulWidget {
  final String newsId;
  const DetailOfNewWidget({super.key, required this.newsId});

  @override
  State<DetailOfNewWidget> createState() => _DetailOfNewWidgetState();
}

class _DetailOfNewWidgetState extends State<DetailOfNewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          DetailOfNewWidgetInfo(),
        ],
      ),
    );
  }
}
