import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/utils/assets_manager.dart';
import 'package:quotes/features/splash/presentation/cubit/locale_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocaleCubit, LocaleState>(
      listener: (context, state) {
        if (state == LocaleGetLanguageSuccessState()) {
          context.read<LocaleCubit>().navigateToHomeScreen(context);
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Image.asset(ImgManager.quote),
          ),
        ),
      ),
    );
  }
}
