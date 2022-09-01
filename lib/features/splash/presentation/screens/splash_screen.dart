import 'package:flutter/material.dart';
import 'package:quotes/core/utils/assets_manager.dart';
import 'package:quotes/features/splash/presentation/cubit/locale_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO try to find another way of implementing this
    LocaleCubit.get(context).navigateToHomeScreen(context);
    // TODO make splash screen fade not suddenly disappear
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset(ImgManager.quote),
        ),
      ),
    );
  }
}
