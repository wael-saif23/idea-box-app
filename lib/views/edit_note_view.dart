import 'package:flutter/material.dart';
import 'package:idea_box_app/controller/read_note_cubit/read_note_cubit_cubit.dart';
import 'package:idea_box_app/controller/write_note_cubit/write_note_cubit_cubit.dart';
import 'package:idea_box_app/core/helper_functions/app_routes.dart';
import 'package:idea_box_app/core/utils/styles/app_colors.dart';
import 'package:idea_box_app/model/note_model.dart';

import 'package:idea_box_app/views/widgets/custom_button.dart';
import 'package:idea_box_app/views/widgets/custom_dialog.dart';
import 'package:idea_box_app/views/widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.theNote});
  final NoteModel theNote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(context),
      body: EditNoteViewBody(
        theNote: theNote,
      ),
    );
  }

  AppBar _getAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          CustomButton(
            iconData: Icons.arrow_back,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            width: 16,
          ),
          const Text('Edit Note'),
        ],
      ),
      actions: [
        CustomButton(
            iconData: Icons.save_as,
            onTap: () {
              _showEditNoteDialog(context);
            }),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }

  Future<dynamic> _showEditNoteDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => CustomDialog(
        title: "Save changes ?",
        firstButtonText: 'Discard',
        colorFirstButton: AppColors.maroon,
        onTapFirstButton: () {
          showDialog(
            context: context,
            builder: (context) => CustomDialog(
              title: "Are your sure you want discard your changes ?",
              firstButtonText: 'Discard',
              colorFirstButton: AppColors.maroon,
              onTapFirstButton: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.detailsView,
                    (Route<dynamic> route) => route.isFirst,
                    arguments: theNote);
                WriteNoteCubitCubit.editSubjectController.clear();
                WriteNoteCubitCubit.editDescriptionController.clear();
              },
              secondbuttonText: 'Keep',
              colorSecondButton: AppColors.black,
              onTapSecondButton: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          );
        },
        secondbuttonText: 'Save',
        colorSecondButton: AppColors.black,
        onTapSecondButton: () {
          WriteNoteCubitCubit.get(context).updateNote(theNote.idAtDatabase);
          ReadNoteCubitCubit.get(context).getAllNotes();
          ReadNoteCubitCubit().getNote(noteIndex: theNote.idAtDatabase);
           Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.detailsView,
                    (Route<dynamic> route) => route.isFirst,
                    arguments: theNote);
         
          WriteNoteCubitCubit.editSubjectController.clear();
          WriteNoteCubitCubit.editDescriptionController.clear();
        },
      ),
    );
  }
}
