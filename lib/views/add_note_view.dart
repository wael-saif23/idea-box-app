import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idea_box_app/controller/read_note_cubit/read_note_cubit_cubit.dart';
import 'package:idea_box_app/controller/write_note_cubit/write_note_cubit_cubit.dart';
import 'package:idea_box_app/core/helper_functions/show_snack_bar.dart';
import 'package:idea_box_app/core/utils/styles/app_colors.dart';
import 'package:idea_box_app/views/widgets/add_note_view_body.dart';

import 'package:idea_box_app/views/widgets/custom_button.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({super.key});

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  GlobalKey<FormState> addNoteFormKey = WriteNoteCubitCubit.addNoteFormKey;

  @override
  Widget build(BuildContext context) {
    return BlocListener<WriteNoteCubitCubit, WriteNoteCubitState>(
      listener: (context, state) {
        if (state is WriteNoteCubitSuccess) {
          showSnackBar(context, "Note Added Successfully");
          Navigator.pop(context);
        } else if (state is WriteNoteCubitFailure) {
          showSnackBar(context, state.message);
        }
      },
      child: Scaffold(
        floatingActionButton: _getFloatingActionButton(context),
        appBar: _getAppBar(context),
        body: const AddNoteViewBody(),
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
          const Text('Add Note'),
        ],
      ),
    );
  }

  FloatingActionButton _getFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.gray,
      foregroundColor: AppColors.orange,
      onPressed: () {
        if (addNoteFormKey.currentState!.validate()) {
          WriteNoteCubitCubit.get(context).addNote();
          ReadNoteCubitCubit.get(context).getAllNotes();
        }
      },
      child: const Icon(Icons.check),
    );
  }
}
