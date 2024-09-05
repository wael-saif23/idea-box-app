import 'package:flutter/material.dart';
import 'package:idea_box_app/model/note_model.dart';
import 'package:idea_box_app/views/widgets/custom_button.dart';
import 'package:idea_box_app/views/widgets/custom_note_item.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final List<NoteModel> notes = [
    NoteModel(
      idAtDatabase: 0,
      title: 'Note 1: lkjalsjdfasdfjasdjfjsfjiasjpjsg',
      description: 'Description 1',
      colorCode: 0xFFE91E63,
    ),
    NoteModel(
      idAtDatabase: 1,
      title: 'Note 2: asdfnovonaowi',
      description: 'Description 2',
      colorCode: 0xFF9C27B0,
    ),
    NoteModel(
      idAtDatabase: 2,
      title: 'Note 3: fsnogsehgmbv',
      description: 'Description 3',
      colorCode: 0xFF673AB7,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Expanded(
                child: CustomNoteItem(
                  colorCode: notes[index].colorCode,
                  title: notes[index].title,
                ),
              ),
            );
          },
        ),
      ),
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
        CustomButton(iconData: Icons.priority_high_rounded, onTap: () {}),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
