import 'package:flutter/material.dart';
import 'package:moneyty/src/values/color.dart';

class AppDarkTheme {
  static AppDarkTheme instance = AppDarkTheme();

  ThemeData getDarkTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.instance.black,
    );
  }
}
