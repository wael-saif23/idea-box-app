import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:idea_box_app/core/constants/hive_constants.dart';
import 'package:idea_box_app/model/note_model.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  SubjectOrDescription subjectOrDescription = SubjectOrDescription.subject;

  static SearchCubit get(context) => BlocProvider.of<SearchCubit>(context);
  final Box noteBox = Hive.box(HiveConstants.noteBox);
  static TextEditingController searchController = TextEditingController();
  List<NoteModel> _getNotesListFromDataBase() =>
      List.from(noteBox.get(HiveConstants.noteList, defaultValue: []))
          .cast<NoteModel>();

  void updatSubjectOrDescription(SubjectOrDescription value) {
    subjectOrDescription = value;
    emit(SearchInitial());
  }

  void search(String searchText) {
    emit(SearchInitial());
    if (searchText.isEmpty) {
      emit(SearchInitial());
    }
    try {
      if (searchText.isNotEmpty) {
        List<NoteModel> searchList = [];
        List<NoteModel> theNoteList = _getNotesListFromDataBase();
        if (subjectOrDescription == SubjectOrDescription.subject) {
          searchList = theNoteList
              .where((note) => note.title
                  .toString()
                  .toLowerCase()
                  .contains(searchText.toLowerCase()))
              .toList();
          if (searchList.isEmpty) {
            emit(SearchSuccessWithNOItems(message: "No results found"));
          }else{
            emit(SearchSuccessInSubject(notes: searchList));
          }
        } else if (subjectOrDescription == SubjectOrDescription.description){
          searchList = theNoteList
              .where((note) => note.description
                  .toString()
                  .toLowerCase()
                  .contains(searchText.toLowerCase()))
              .toList();
            if (searchList.isEmpty) {
            emit(SearchSuccessWithNOItems(message: "No results found"));
          }else{
            emit(SearchSuccessInSubject(notes: searchList));
          }
        }
      }
    } catch (e) {
      emit(SearchFailure(
          message:
              "Sorry an error occurred while searching. with error : ${e.toString()}"));
    }
  }
}

enum SubjectOrDescription {
  subject,
  description,
}
