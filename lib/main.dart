import 'package:flutter/material.dart';
import 'package:forestvpn_test/details/detail_of_new_widget.dart';
import 'package:forestvpn_test/main_screen/main_screen_widget.dart';

void main() {
  runApp(const ForestVPNTestApp());
}

class ForestVPNTestApp extends StatelessWidget {
  const ForestVPNTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ForestVPN test',
      routes: {
        '/': (context) => const MainScreenWidget(),
        '/main_screen/details': (context) {
          final args = ModalRoute.of(context)?.settings.arguments;
          if (args is String) {
            return DetailOfNewWidget(newsId: args);
          } else {
            return const DetailOfNewWidget(newsId: '');
          }
        },
      },
      initialRoute: '/',
    );
  }
}
