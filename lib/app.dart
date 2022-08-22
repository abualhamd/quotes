import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/light_theme.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: themeLight,
      initialRoute: Routes.initialRoute,
      routes: routes,
    );
  }
}