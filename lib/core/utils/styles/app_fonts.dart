import 'package:flutter/material.dart';
import 'package:idea_box_app/core/utils/styles/app_colors.dart';

abstract class AppFonts {
  static const String KfontFamily = 'Nunito';

  static const TextStyle NunitoRegular25 = TextStyle(
    fontFamily: KfontFamily,
    fontSize: 25,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static const TextStyle NunitoRegular35 = TextStyle(
    fontFamily: KfontFamily,
    fontSize: 35,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static const TextStyle NunitoRegular48 = TextStyle(
    fontFamily: KfontFamily,
    fontSize: 48,
    fontWeight: FontWeight.w400,
    color: AppColors.gray,
  );

  static const TextStyle NunitoRegular18 = TextStyle(
    fontFamily: KfontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static const TextStyle NunitoRegularGray23 = TextStyle(
    fontFamily: KfontFamily,
    fontSize: 23,
    fontWeight: FontWeight.w400,
    color: AppColors.gray,
  );

  static const TextStyle NunitoRegularWhite23 = TextStyle(
    fontFamily: KfontFamily,
    fontSize: 23,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static const TextStyle NunitoSemiBold38 = TextStyle(
    fontFamily: KfontFamily,
    fontSize: 38,
    fontWeight: FontWeight.w600,
    color: AppColors.orange,
  );

  static const TextStyle NunitoLight20 = TextStyle(
    fontFamily: KfontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w300,
    color: AppColors.black,
  );
}
