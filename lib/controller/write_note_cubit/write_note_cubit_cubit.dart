import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:idea_box_app/core/constants/hive_constants.dart';
import 'package:idea_box_app/model/note_model.dart';
import 'package:meta/meta.dart';

part 'write_note_cubit_state.dart';

class WriteNoteCubitCubit extends Cubit<WriteNoteCubitState> {
  WriteNoteCubitCubit() : super(WriteNoteCubitInitial());
  static WriteNoteCubitCubit get(context) =>
      BlocProvider.of<WriteNoteCubitCubit>(context);

  final Box noteBox = Hive.box(HiveConstants.noteBox);
  static GlobalKey<FormState> addNoteFormKey = GlobalKey<FormState>();
  String noteSubject = "";
  String noteDescription = "";
  int noteColorCode = 0xff000000;


  void updateNoteColor(int colorCode) {
    noteColorCode = colorCode;
    emit(WriteNoteCubitInitial());
  }

  void updateNoteSubject(String subject) {
    noteSubject = subject;
    emit(WriteNoteCubitInitial());
  }

  void updateNoteDescription(String description) {
    noteDescription = description;
    emit(WriteNoteCubitInitial());
  }

  void addNote() async {
    _tryAndCatchBlock(
        methodToExecute: () async {
          List<NoteModel> updatedNoteList = _getNotesListFromDataBase();
          updatedNoteList.add(NoteModel(
            idAtDatabase: updatedNoteList.length,
            title: noteSubject,
            description: noteDescription,
            colorCode: noteColorCode,
          ));
          await noteBox.put(HiveConstants.noteList, updatedNoteList);
        },
        massage: 'Sorry an error occurred while adding note.');
  }

  void updateNote(int noteIdInDatabase) async {
    _tryAndCatchBlock(
        methodToExecute: () async {
          List<NoteModel> updatedNoteList = _getNotesListFromDataBase();
          updatedNoteList[noteIdInDatabase] = NoteModel(
            idAtDatabase: noteIdInDatabase,
            title: noteSubject,
            description: noteDescription,
            colorCode: noteColorCode,
          );
          await noteBox.put(HiveConstants.noteList, updatedNoteList);
        },
        massage: 'Sorry an error occurred while updating note.');
  }

  void deleteNote(int noteIdInDatabase) async {
    _tryAndCatchBlock(
        methodToExecute: () async {
          List<NoteModel> updatedNoteList = _getNotesListFromDataBase();
          updatedNoteList.removeAt(noteIdInDatabase);
          for (var i = noteIdInDatabase; i < updatedNoteList.length; i++) {
            updatedNoteList[i] = updatedNoteList[i].decrementIdAtDatabase();
          }
          await noteBox.put(HiveConstants.noteList, updatedNoteList);
        },
        massage: 'Sorry an error occurred while deleting note.');
  }

  void deleteAllNotes() async {
    _tryAndCatchBlock(
        methodToExecute: () async {
          List<NoteModel> updatedNoteList = _getNotesListFromDataBase();
          updatedNoteList.clear();
          await noteBox.put(HiveConstants.noteList, updatedNoteList);
        },
        massage: 'Sorry an error occurred while deleting all notes.');
  }

  void _tryAndCatchBlock(
      {required VoidCallback methodToExecute, required String massage}) {
    emit(WriteNoteCubitLoading());
    try {
      methodToExecute.call();
      emit(WriteNoteCubitSuccess());
    } catch (e) {
      emit(WriteNoteCubitFailure(
        "$massage , with error : ${e.toString()}",
      ));
    }
  }

  List<NoteModel> _getNotesListFromDataBase() =>
      List.from(noteBox.get(HiveConstants.noteList, defaultValue: []))
          .cast<NoteModel>();
}
