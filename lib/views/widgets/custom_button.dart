import 'package:flutter/material.dart';
import 'package:idea_box_app/core/utils/styles/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.iconData,
      required this.onTap,
      this.text,
      this.containerColor = AppColors.gray});
  final IconData? iconData;
  final VoidCallback onTap;
  final Text? text;
  final Color? containerColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: _getBoxDecoration(),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (text != null) text!,
            if (text != null && iconData != null)
              const SizedBox(
                height: 8,
              ),
            if (iconData != null)
              Center(
                child: Icon(
                  iconData,
                  size: 28,
                  color: AppColors.orange,
                ),
              ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _getBoxDecoration() => BoxDecoration(
        color: containerColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      );
}
