import 'package:flutter/material.dart';
import 'package:idea_box_app/core/utils/styles/app_colors.dart';

class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild(
      {super.key,
      this.maxLines = 3,
     this.lablelText,
      this.controller,
      this.onChanged,
      this.addValidator, this.hintText,});
  final int maxLines;
  final String? lablelText;
  final String? hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final VoidCallback? addValidator;
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
        (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          addValidator?.call();
          return null;
        };
        return null;
      },
    );
  }

  InputDecoration _getFieldDecoration() {
    return InputDecoration(
      hintText: hintText,
      hintStyle:  TextStyle(color: AppColors.gray.withOpacity(.7)),
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
