import 'package:flutter/material.dart';
import 'package:idea_box_app/core/utils/styles/app_colors.dart';
import 'package:idea_box_app/core/utils/styles/app_fonts.dart';

abstract class AppStyle {
  static ThemeData? themeData() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.black,
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Colors.white30,
        cursorColor: Colors.white30,
        selectionHandleColor: Colors.white30,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.black,
        elevation: 0,
        titleTextStyle: AppFonts.NunitoSemiBold43,
      ),
    );
  }
}
