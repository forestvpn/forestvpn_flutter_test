import 'package:flutter/material.dart';
import 'package:forestvpn_test/utils/utils.dart';
import 'utils/auto_route/router.dart';

class ForestVPNTestApp extends StatefulWidget {
  const ForestVPNTestApp({Key? key}) : super(key: key);

  @override
  State<ForestVPNTestApp> createState() => _ForestVPNTestAppState();
}

class _ForestVPNTestAppState extends State<ForestVPNTestApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ForestVPN test',
      theme: theme,
      routerConfig: _appRouter.config(),
    );
  }
}
