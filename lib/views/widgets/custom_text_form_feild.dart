import 'package:flutter/material.dart';
import 'package:idea_box_app/core/utils/styles/app_colors.dart';

class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild(
      {super.key, this.maxLines = 3, required this.lablelText, this.controller, this.onChanged});
  final int maxLines;
  final String lablelText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      minLines: 1,
      maxLines: maxLines,
      cursorColor: AppColors.yellow.withOpacity(.5),
      cursorErrorColor: AppColors.maroon,
      style: const TextStyle(color: AppColors.white),
      decoration: _getFieldDecoration(),
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  InputDecoration _getFieldDecoration() {
    return InputDecoration(
      labelText: lablelText,
      labelStyle: TextStyle(color: AppColors.yellow.withOpacity(.5)),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.yellow),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.yellow),
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.maroon),
      ),
      focusedErrorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.maroon),
      ),
    );
  }
}
