import 'package:flutter/material.dart';

import '../constant/Colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData.light().copyWith(
      colorScheme: const ColorScheme.light(primary: AppColors.deepgreen),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
            color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 30),
        titleMedium: TextStyle(
            color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 23),
        titleSmall: TextStyle(
            color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 18),
        bodyMedium: TextStyle(
            fontSize: 20, color: AppColors.blue, fontWeight: FontWeight.bold),
        bodySmall: TextStyle(color: AppColors.black, fontSize: 16),
        displaySmall: TextStyle(
            color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 10),
        labelMedium: TextStyle(
            color: AppColors.black, fontWeight: FontWeight.bold, fontSize: 18),
      ));
}
