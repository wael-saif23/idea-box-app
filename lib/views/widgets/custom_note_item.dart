import 'package:flutter/material.dart';
import 'package:idea_box_app/core/utils/styles/app_colors.dart';
import 'package:idea_box_app/core/utils/styles/app_fonts.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem(
      {super.key, required this.colorCode, required this.title});
  final int colorCode;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(colorCode),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: AppColors.gray,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Text(
        title,
        style: AppFonts.NunitoRegular25,
      ),
    );
  }
}
