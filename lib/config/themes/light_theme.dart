import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_strings.dart';
import '../../core/utils/app_colors.dart';

final ThemeData themeLight = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
  primaryColor: AppColors.random,
  primarySwatch: AppColors.primaryMaterial,
  fontFamily: AppStrings.fontFamily,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    color: Colors.transparent,
    elevation: 0,
    titleTextStyle: TextStyle(
        fontFamily: AppStrings.fontFamily,
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: AppColors.primary),
  ),
  iconTheme: IconThemeData(
    color: AppColors.primary,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      backgroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
      textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
          // color: Colors.white,
          // backgroundColor: Colors.white,
          )),
    ),
  ),
  // textTheme: TextTheme(
  //   button: TextStyle(
  //     fontSize: 16,
  //     color: AppColors.random,
  //     fontWeight: FontWeight.bold,
  //   ),
  // ),
);
