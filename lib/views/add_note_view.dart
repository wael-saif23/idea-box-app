import 'package:flutter/material.dart';
import 'package:idea_box_app/core/utils/styles/app_colors.dart';
import 'package:idea_box_app/views/widgets/add_note_view_body.dart';

import 'package:idea_box_app/views/widgets/custom_button.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _getFloatingActionButton(context),
      appBar: _getAppBar(context),
      body: const AddNoteViewBody(),
      );
  }

  AppBar _getAppBar(BuildContext context) {
    return AppBar(
      leading: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: CustomButton(
              iconData: Icons.arrow_back,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      title: const Text('Add Note'),
      actions: [
        CustomButton(iconData: Icons.search, onTap: () {}),
        const SizedBox(
          width: 16,
        ),
        CustomButton(iconData: Icons.priority_high_rounded, onTap: () {}),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }

  FloatingActionButton _getFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.gray,
      foregroundColor: AppColors.orange,
      onPressed: () {},
      child: const Icon(Icons.check),
    );
  }
}
