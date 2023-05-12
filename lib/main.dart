import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/bloc_observer.dart';
import 'app.dart';
import 'injection_container.dart' as di;

import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await di.init();
  Bloc.observer = MyBlocObserver();

  runApp(const QuoteApp());
}
