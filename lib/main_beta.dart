import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'package:flutter/services.dart';
import 'package:base_project/so_like_app.dart';

Future<void> main() async {
  F.appFlavor = Flavor.beta;

  //You will need to initialize AppThemeNotifier class for theme changes.
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  await AppService.initAsync();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en'),
      ],
      path: 'assets/lang',
      fallbackLocale: Locale('en'),
      child: App(),
    ),
  );
}
