import 'package:flutter/material.dart';
import 'package:quotes/core/utils/assets_manager.dart';

import '../../../../config/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, Routes.randomQuoteRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO try to find another way of implementing this
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
