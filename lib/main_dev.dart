import 'dart:async';
import 'package:flutter/material.dart';
import 'app.dart';
import 'package:flutter/services.dart';
import 'package:base_project/so_like_app.dart';

Future<void> main() async {
  F.appFlavor = Flavor.dev;

  //You will need to initialize AppThemeNotifier class for theme changes.
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  await AppService.initAsync();
  AppTheme.init();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(ChangeNotifierProvider<AppNotifier>(
    create: (context) => AppNotifier(),
    child: const App(),
  ));
}
