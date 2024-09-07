import 'package:flutter/material.dart';
import 'package:idea_box_app/core/utils/styles/app_colors.dart';
import 'package:idea_box_app/core/utils/styles/app_fonts.dart';

abstract class AppStyle {
  static ThemeData? themeData() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.black,
        elevation: 0,
        titleTextStyle: AppFonts.NunitoSemiBold43,
        iconTheme: IconThemeData(color: AppColors.orange),
      ),
    );
  }
}
