import 'package:flutter/material.dart';
import 'package:idea_box_app/core/utils/styles/app_colors.dart';
import 'package:idea_box_app/core/utils/styles/app_fonts.dart';
import 'package:idea_box_app/views/widgets/custom_button.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {super.key,
      this.title,
      this.content,
      this.firstButtonText,
      this.secondbuttonText,
      this.onTapFirstButton,
      this.onTapSecondButton});
  final String? title;
  final String? content;
  final String? firstButtonText, secondbuttonText;
  final VoidCallback? onTapFirstButton, onTapSecondButton;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.black,
      icon: const Icon(
        Icons.warning,
        color: AppColors.orange,
        size: 30,
      ),
      title: title != null
          ? Text(
              title ?? "",
              style: AppFonts.NunitoRegularGray23.copyWith(
                color: AppColors.orange,
                fontWeight: FontWeight.bold,
              ),
            )
          : null,
      content: content != null
          ? Text(
              content ?? '',
              style: AppFonts.NunitoRegular18.copyWith(
                  color: AppColors.yellow.withOpacity(.7)),
            )
          : null,
      actions: [
        if (firstButtonText != null)
          CustomButton(
            text: Text(
              'Cancel',
              style: AppFonts.NunitoRegular18.copyWith(
                color: AppColors.yellow.withOpacity(.9),
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              onTapFirstButton?.call();
            },
          ),
        if (secondbuttonText != null)
          CustomButton(
              text: Text(
                'Delete',
                style: AppFonts.NunitoRegular18.copyWith(
                  color: AppColors.maroon,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                onTapSecondButton?.call();
              })
      ],
    );
  }
}
