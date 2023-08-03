import 'package:flutter/material.dart';

import 'presentation/main_screen_widget.dart';

void main() {
  runApp(const ForestVPNTestApp());
}

class ForestVPNTestApp extends StatelessWidget {
  const ForestVPNTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ForestVPN test',
      home: MainScreenWidget(),
    );
  }
}
