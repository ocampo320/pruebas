import 'package:app/app/settings/app_localizations.dart';
import 'package:app/ui/home_page.dart';
import 'package:app/ui/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SicomApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        RefreshLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("es"),
        const Locale("en"),
      ],
      home: SplashPage(),
    );
  }
}
