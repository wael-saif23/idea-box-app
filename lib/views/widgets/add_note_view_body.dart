import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:idea_box_app/controller/write_note_cubit/write_note_cubit_cubit.dart';
import 'package:idea_box_app/views/widgets/colors_wedget.dart';
import 'package:idea_box_app/views/widgets/custom_text_form_feild.dart';

class AddNoteViewBody extends StatelessWidget {
  const AddNoteViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
          child: BlocBuilder<WriteNoteCubitCubit, WriteNoteCubitState>(
        builder: (context, state) {
          return Form(
            key: WriteNoteCubitCubit.addNoteFormKey,
            child: Column(
              children: [
                CustomTextFormFeild(
                  onChanged: (value) =>
                      WriteNoteCubitCubit.get(context).updateNoteSubject(value),
                  controller: WriteNoteCubitCubit.subjectController,
                  lablelText: "Note Subject",
                ),
                const SizedBox(height: 16),
                CustomTextFormFeild(
                  onChanged: (value) => WriteNoteCubitCubit.get(context)
                      .updateNoteDescription(value),
                  controller: WriteNoteCubitCubit.descriptionController,
                  maxLines: 10,
                  lablelText: "Note description",
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
