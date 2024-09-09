import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idea_box_app/controller/read_note_cubit/read_note_cubit_cubit.dart';
import 'package:idea_box_app/core/helper_functions/app_routes.dart';
import 'package:idea_box_app/core/helper_functions/loading_widget.dart';
import 'package:idea_box_app/core/utils/styles/app_colors.dart';
import 'package:idea_box_app/model/note_model.dart';
import 'package:idea_box_app/views/widgets/custom_button.dart';
import 'package:idea_box_app/views/widgets/custom_note_item.dart';
import 'package:idea_box_app/views/widgets/empty_notes_in_home_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _getFloatingActionButton(context),
      appBar: _getAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<ReadNoteCubitCubit, ReadNoteCubitState>(
          builder: (context, state) {
            if (state is ReadNoteCubitSuccessAll) {
              return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Expanded(
                      child: CustomNoteItem(
                        onPressedToDatailsView: () {
                          Navigator.pushNamed(context, AppRoutes.detailsView,
                              arguments: notes[index]);
                        },
                        colorCode: notes[index].colorCode,
                        title: notes[index].title,
                      ),
                    ),
                  );
                },
              );
            } else if (state is ReadNoteCubitLoading) {
              return const Center(
                child: LoadingWidget(),
              );
            } else {
              return const EmptyNotesInHomeView();
            }
          },
        ),
      ),
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

  AppBar _getAppBar() {
    return AppBar(
      title: const Text('Notes'),
      actions: [
        CustomButton(iconData: Icons.search, onTap: () {}),
        const SizedBox(
          width: 16,
        ),
        CustomButton(iconData: Icons.delete_sweep_outlined, onTap: () {}),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }

  final List<NoteModel> notes = const [
    NoteModel(
      idAtDatabase: 0,
      title: 'Note 1: lkjalsjdfasdfjasdjfjsfjiasjpjsg',
      description: 'Description 1',
      colorCode: 0xFF6A9C89,
    ),
    NoteModel(
      idAtDatabase: 1,
      title: 'Note 2: asdfnovonaowi',
      description: 'Description 2',
      colorCode: 0xff7695FF,
    ),
    NoteModel(
      idAtDatabase: 2,
      title: 'Note 3: fsnogsehgmbv',
      description: 'Description 3',
      colorCode: 0xffFFD7C4,
    ),
  ];
}
