import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/config/locale/app_localizations_setup.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/splash/presentation/cubit/locale_cubit.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/light_theme.dart';
import 'injection_container.dart' as di;

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<LocaleCubit>()..getSavedLanguage(),
      child: BlocConsumer<LocaleCubit, LocaleState>(
        listener: (context, state) {},
        buildWhen: (previous, current) =>
            (current == LocaleGetLanguageSuccessState() ||
                current == LocaleChangeLanguageSuccessState()),
        builder: (context, state) {
          LocaleCubit cubit = LocaleCubit.get(context);
          return MaterialApp(
            title: AppStrings.appName,
            theme: themeLight,
            initialRoute:
                Routes.splashRoute, //.randomQuoteRoute, //Routes.splashRoute,
            routes: routes,
            locale: Locale(cubit.currentLangCode),
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
          );
        },
      ),
    );
  }
}
