import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idea_box_app/core/utils/styles/app_colors.dart';
import 'package:idea_box_app/core/utils/styles/app_images.dart';

class EmptyNotesInHomeView extends StatelessWidget {
  const EmptyNotesInHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImages.imagesNoteImageSvg,
            fit: BoxFit.fitHeight,
            width: MediaQuery.of(context).size.width * 0.75,
          ),
          const SizedBox(
            height: 8,
          ),
          const Text("Create your first note !",
              style: TextStyle(
                color: AppColors.orange,
              )),
        ],
      ),
    );
  }
}
