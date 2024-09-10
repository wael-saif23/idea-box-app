import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idea_box_app/controller/read_note_cubit/read_note_cubit_cubit.dart';
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
    return BlocProvider<ReadNoteCubitCubit>(
      create: (context) => ReadNoteCubitCubit()..getNote(noteIndex: theNote.idAtDatabase),
      child: Scaffold(
        appBar: _getAppBar(context),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<ReadNoteCubitCubit, ReadNoteCubitState>(
            builder: (context, state) {
              if (state is ReadNoteCubitFailure) {
                return const Center(child: Text('Something went wrong'));
              }else if(state is ReadNoteCubitSuccessOne){
                return _successReadNoteWidget(state);
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  SingleChildScrollView _successReadNoteWidget(ReadNoteCubitSuccessOne state) {
    
    return SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.note.title,
                      style: AppFonts.NunitoRegular35,
                    ),
                    const Divider(
                      color: AppColors.yellow,
                      endIndent: 24,
                      indent: 24,
                      height: 50,
                    ),
                    Text(
                      state.note.description,
                      style: AppFonts.NunitoRegularWhite23,
                    ),
                  ]),
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
          const Text('Details View'),
        ],
      ),
      actions: [
        CustomButton(
            iconData: Icons.edit,
            onTap: () {
              Navigator.pushReplacementNamed(context, AppRoutes.editNoteView,
                  arguments: theNote);
            }),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
