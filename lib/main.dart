import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quotes/bloc_observer.dart';
import 'package:quotes/service_providers/providers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';
import 'injection_container.dart' as di;

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'provider_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await di.init();
  Bloc.observer = MyBlocObserver();
  final sharedPrefs = await SharedPreferences.getInstance();
  runApp(ProviderScope(
    observers: [MyObserver()],
    overrides: [sharedPrefsProvider.overrideWith((ref) => sharedPrefs)],
    child: const QuoteApp(),
  ));
}
