import 'package:base_project/core/route/app_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:base_project/so_like_app.dart';
import 'package:easy_localization/easy_localization.dart' as el;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logger/web.dart';


final appRouter = AppRouter();
final logger = Logger(level: Level.debug);

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: F.title,
      home: _flavorBanner(
        child: Container(),
        show: kDebugMode,
      ),
      builder: (context, child) {
        return MaterialApp.router(
            localizationsDelegates: [
              el.EasyLocalization.of(context)!.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            title: F.title,
            routerConfig: appRouter.config(),
            builder: (context, child) {
              return _flavorBanner(
                child: child ?? Container(),
                show: kDebugMode,
              );
            },
          );
      },
    );
  }

  Widget _flavorBanner({
    required Widget child,
    bool show = true,
  }) =>
      show
          ? Banner(
              child: child,
              location: BannerLocation.topStart,
              message: F.name,
              color: Colors.green.withOpacity(0.6),
              textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12.0,
                  letterSpacing: 1.0),
              textDirection: TextDirection.ltr,
            )
          : Container(
              child: child,
            );
}
