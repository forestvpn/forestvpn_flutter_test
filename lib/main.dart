import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/blocs/all_news_bloc/all_news_bloc.dart';
import 'package:forestvpn_test/screens/news_list_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const ForestVPNTestApp());
}

class ForestVPNTestApp extends StatelessWidget {
  const ForestVPNTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ForestVPN test',
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AllNewsBloc>(create: (context) => AllNewsBloc()),
          // BlocProvider<GetOneNewBloc>(create: (context) => GetOneNewBloc()),
        ],
        child: const NewsListScreen(),
      ),
    );
  }
}
