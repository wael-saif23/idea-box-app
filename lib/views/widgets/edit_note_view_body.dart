import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idea_box_app/controller/write_note_cubit/write_note_cubit_cubit.dart';
import 'package:idea_box_app/model/note_model.dart';
import 'package:idea_box_app/views/widgets/colors_wedget.dart';
import 'package:idea_box_app/views/widgets/custom_text_form_feild.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key, required this.theNote});
 final NoteModel theNote;
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
          child: BlocBuilder<WriteNoteCubitCubit, WriteNoteCubitState>(
            
        builder: (context, state) {
           WriteNoteCubitCubit.editSubjectController.text = theNote.title;
          WriteNoteCubitCubit.editDescriptionController.text = theNote.description;
          return Form(
            key: WriteNoteCubitCubit.addEditNoteFormKey,
            child: Column(
              children: [
                CustomTextFormFeild(
                  onChanged: (value) =>
                      WriteNoteCubitCubit.get(context).updateNoteSubject(value),
                  controller: WriteNoteCubitCubit.editSubjectController,
                  lablelText: "subject",
                ),
                const SizedBox(height: 16),
                CustomTextFormFeild(
                  onChanged: (value) => WriteNoteCubitCubit.get(context)
                      .updateNoteDescription(value),
                  controller: WriteNoteCubitCubit.editDescriptionController,
                  maxLines: 10,
                  lablelText: "description",
                ),
                const SizedBox(height: 16),
                ColorsWedget(
                  activeColorCode:
                      WriteNoteCubitCubit.get(context).noteColorCode,
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}
