import 'package:flutter/material.dart';
import 'package:idea_box_app/controller/read_note_cubit/read_note_cubit_cubit.dart';
import 'package:idea_box_app/controller/write_note_cubit/write_note_cubit_cubit.dart';
import 'package:idea_box_app/core/helper_functions/app_routes.dart';
import 'package:idea_box_app/model/note_model.dart';

import 'package:idea_box_app/views/widgets/custom_button.dart';
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
              WriteNoteCubitCubit.get(context).updateNote(theNote.idAtDatabase);
              ReadNoteCubitCubit.get(context).getAllNotes();
              ReadNoteCubitCubit().getNote(noteIndex: theNote.idAtDatabase);
               Navigator.pushReplacementNamed(context, AppRoutes.detailsView,
                  arguments: theNote);
              WriteNoteCubitCubit.editSubjectController.clear();
              WriteNoteCubitCubit.editDescriptionController.clear();
              // Navigator.pushNamedAndRemoveUntil(context, AppRoutes.detailsView,
              //     (Route) => Route.settings.name == AppRoutes.homeView,
              //     arguments: theNote);
            }),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
