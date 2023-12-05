import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quotes/bloc_observer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'injection_providers/providers.dart';
import 'provider_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  // await di.init();
  Bloc.observer = MyBlocObserver();
  final sharedPrefs = await SharedPreferences.getInstance();
  runApp(ProviderScope(
    observers: [MyObserver()],
    overrides: [sharedPrefsProvider.overrideWith((ref) => sharedPrefs)],
    child: const QuoteApp(),
  ));
}
