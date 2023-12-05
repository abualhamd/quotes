import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quotes/config/locale/app_localizations_setup.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/splash/presentation/provider/locale_provider.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/light_theme.dart';

class QuoteApp extends ConsumerWidget {
  const QuoteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLangCode =
        ref.watch(languageCodeProvider).value ?? AppStrings.englishCode;
    return MaterialApp(
      title: AppStrings.appName,
      theme: themeLight,
      initialRoute:
          Routes.splashRoute,
      routes: routes,
      locale: Locale(currentLangCode),
      supportedLocales: AppLocalizationsSetup.supportedLocales,
      localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
      localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
    );
  }
}
