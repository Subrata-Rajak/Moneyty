import 'package:flutter/material.dart';
import 'package:moneyty/src/values/color.dart';

class AppLightTheme {
  static AppLightTheme instance = AppLightTheme();

  ThemeData getLightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.instance.white,
    );
  }
}
