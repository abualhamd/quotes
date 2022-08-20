import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_strings.dart';
import '../../core/utils/app_colors.dart';

final ThemeData themeLight = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.random,
  fontFamily: AppStrings.fontFamily,
  textTheme: TextTheme(
    button: TextStyle(
      fontSize: 16,
      color: AppColors.random,
      fontWeight: FontWeight.bold,

    )
  )
);