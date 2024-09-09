import 'package:flutter/material.dart';
import 'package:idea_box_app/core/utils/styles/app_colors.dart';
import 'package:idea_box_app/views/widgets/add_note_view_body.dart';

import 'package:idea_box_app/views/widgets/custom_button.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({super.key});

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        floatingActionButton: _getFloatingActionButton(context),
        appBar: _getAppBar(context),
        body: const AddNoteViewBody(),
        ),
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
      
    );
  }

  FloatingActionButton _getFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.gray,
      foregroundColor: AppColors.orange,
      onPressed: () {
        // if (_formKey.currentState!.validate()) {
        //   Navigator.pushNamed(context, AppRoutes.homeView);
        // }
      },
      child: const Icon(Icons.check),
    );
  }
}
