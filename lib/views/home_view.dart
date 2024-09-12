import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idea_box_app/controller/read_note_cubit/read_note_cubit_cubit.dart';
import 'package:idea_box_app/controller/write_note_cubit/write_note_cubit_cubit.dart';
import 'package:idea_box_app/core/helper_functions/app_routes.dart';
import 'package:idea_box_app/core/helper_functions/exception_widget.dart';
import 'package:idea_box_app/core/helper_functions/loading_widget.dart';
import 'package:idea_box_app/core/utils/styles/app_colors.dart';

import 'package:idea_box_app/views/widgets/custom_button.dart';
import 'package:idea_box_app/views/widgets/custom_dialog.dart';
import 'package:idea_box_app/views/widgets/custom_note_item.dart';
import 'package:idea_box_app/views/widgets/empty_notes_in_home_view.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _getFloatingActionButton(context),
      appBar: _getAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child:
         BlocBuilder<ReadNoteCubitCubit, ReadNoteCubitState>(
          builder: (context, state) {
            if (state is ReadNoteCubitSuccessAll) {
              if (state.notes.isEmpty) {
                return const EmptyNotesInHomeView();
              }
              return _getNotesWidget(state);
            } else if (state is ReadNoteCubitFailure) {
              return _getReadingFailureWidget(message: state.message);
            } else {
              return const Center(
                child: LoadingWidget(),
              );
            }
          },
        ),
      ),
    );
  }

  ListView _getNotesWidget(ReadNoteCubitSuccessAll state) {
    return
     ListView.builder(
      itemCount: state.notes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Expanded(
            child: CustomNoteItem(
              onPressedToDatailsView: () {
                Navigator.pushNamed(context, AppRoutes.detailsView,
                    arguments: state.notes[index]);
              },
              onPressedToDeleteItem: () {
                showDialog(
                    context: context,
                    builder: (context) => CustomDialog(
                          title: 'Delete Note',
                          content: 'Are you sure you want to delete this note?',
                          firstButtonText: 'Cancel',
                          secondbuttonText: 'Delete',
                          onTapFirstButton: () => Navigator.pop(context),
                          onTapSecondButton: () {
                            WriteNoteCubitCubit.get(context)
                                .deleteNote(state.notes[index].idAtDatabase);
                            ReadNoteCubitCubit.get(context).getAllNotes();
                            Navigator.pop(context);
                          },
                        ));
              },
              colorCode: state.notes[index].colorCode,
              title: state.notes[index].title,
            ),
          ),
        );
      },
    );
  }

  FloatingActionButton _getFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.gray,
      foregroundColor: AppColors.orange,
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.addNoteView);
      },
      child: const Icon(Icons.add),
    );
  }

  AppBar _getAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Notes'),
      actions: [
        CustomButton(iconData: Icons.search, onTap: () {
          Navigator.pushNamed(context, AppRoutes.searchView);
        }),
        const SizedBox(
          width: 16,
        ),
        CustomButton(
            iconData: Icons.delete_sweep_outlined,
            onTap: () {
              _showDeleteAllNotesDialog(context);
            }),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }

  Widget _getReadingFailureWidget({required String message}) {
    return ExceptionWidget(
        iconData: Icons.sentiment_dissatisfied, message: message);
  }

  void _showDeleteAllNotesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomDialog(
          title: 'Delete All Notes !',
          content: 'Are you sure you want to delete all notes?',
          firstButtonText: 'Cancel',
          onTapFirstButton: () {
            Navigator.pop(context);
          },
          secondbuttonText: 'Delete',
          onTapSecondButton: () {
            WriteNoteCubitCubit.get(context).deleteAllNotes();
            ReadNoteCubitCubit.get(context).getAllNotes();
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
