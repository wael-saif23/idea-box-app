import 'package:flutter/material.dart';
import 'package:idea_box_app/core/utils/styles/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.iconData, required this.onTap});
  final IconData iconData;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: _getBoxDecoration(),
        padding: const EdgeInsets.all(8),
        child: Icon(
          iconData,
          size: 28,
          color: AppColors.orange,
        ),
      ),
    );
  }

  BoxDecoration _getBoxDecoration() => const BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      );
}
