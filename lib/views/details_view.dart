import 'package:flutter/material.dart';
import 'package:idea_box_app/core/helper_functions/app_routes.dart';
import 'package:idea_box_app/core/utils/styles/app_colors.dart';
import 'package:idea_box_app/core/utils/styles/app_fonts.dart';
import 'package:idea_box_app/model/note_model.dart';
import 'package:idea_box_app/views/widgets/custom_button.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.theNote});
  final NoteModel theNote;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              theNote.title,
              style: AppFonts.NunitoRegular35,
            ),
            const Divider(
              color: AppColors.yellow,
              endIndent: 24,
              indent: 24,
              height: 50,
            ),
            Text(
              theNote.description,
              style: AppFonts.NunitoRegularWhite23,
            ),
          ]),
        ),
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
      title: const Text('Details View'),
      actions: [
        CustomButton(
            iconData: Icons.edit,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.editNoteView);
            }),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
