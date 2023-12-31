import 'package:flutter/material.dart';
import 'package:moneyty/src/values/color.dart';

class AppLightTheme {
  static AppLightTheme instance = AppLightTheme();

  ThemeData getLightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.instance.white,
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppColors.instance.black,
        ),
        titleMedium: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: AppColors.instance.grey,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.instance.grey,
        ),
      ),
    );
  }
}
