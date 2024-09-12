import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:idea_box_app/core/constants/hive_constants.dart';
import 'package:idea_box_app/model/note_model.dart';
import 'package:meta/meta.dart';

part 'read_note_cubit_state.dart';

class ReadNoteCubitCubit extends Cubit<ReadNoteCubitState> {
  ReadNoteCubitCubit() : super(ReadNoteCubitInitial());

  static ReadNoteCubitCubit get(context) => BlocProvider.of(context);

  final Box noteBox = Hive.box(HiveConstants.noteBox);


  void getNote({required int noteIndex}) {
    _tryAndCatchBlockOneNote(
      methodToExecute: () {
        List<NoteModel> getNotesReturned = _getNotesListFromDataBase();
        NoteModel note = getNotesReturned[noteIndex];
        emit(ReadNoteCubitSuccessOne(note: note));
      },
      massage: "Sorry an error occurred while getting note.",
    );
  }

  getAllNotes() {
    _tryAndCatchBlockAllNotes(
        methodToExecute: () {
          List<NoteModel> getNotesReturned = _getNotesListFromDataBase();
          _reverseListMethod(getNotesReturned);
          emit(ReadNoteCubitSuccessAll(notes: getNotesReturned));
        },
        massage: "Sorry an error occurred while getting all notes.");
  }

  void _reverseListMethod(List<NoteModel> getNotesReturned) {
    for (var i = 0; i < getNotesReturned.length / 2; i++) {
      NoteModel temp = getNotesReturned[i];
      getNotesReturned[i] = getNotesReturned[getNotesReturned.length - 1 - i];
      getNotesReturned[getNotesReturned.length - 1 - i] = temp;
    }
  }

  void _tryAndCatchBlockAllNotes({
    required VoidCallback methodToExecute,
    required String massage,
  }) {
    emit(ReadNoteCubitLoading());
    try {
      methodToExecute.call();
    } catch (e) {
      emit(ReadNoteCubitFailure(
        message: "$massage , with error : ${e.toString()}",
      ));
    }
  }

  void _tryAndCatchBlockOneNote({
    required VoidCallback methodToExecute,
    required String massage,
  }) {
    emit(ReadNoteCubitLoading());
    try {
      methodToExecute.call();
    } catch (e) {
      emit(ReadNoteCubitFailure(
        message: "$massage , with error : ${e.toString()}",
      ));
    }
  }

  List<NoteModel> _getNotesListFromDataBase() =>
      List.from(noteBox.get(HiveConstants.noteList, defaultValue: []))
          .cast<NoteModel>();
}
