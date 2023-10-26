import 'package:flutter/material.dart';
import 'package:forestvpn_test/utils/utils.dart';

import 'news_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializaeBeforeAppStart();
  runApp(const ForestVPNTestApp());
}
