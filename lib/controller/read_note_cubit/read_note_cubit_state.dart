part of 'read_note_cubit_cubit.dart';

@immutable
sealed class ReadNoteCubitState {}

final class ReadNoteCubitInitial extends ReadNoteCubitState {}

final class ReadNoteCubitLoading extends ReadNoteCubitState {}

final class ReadNoteCubitSuccessAll extends ReadNoteCubitState {
  final List<NoteModel> notes;
  ReadNoteCubitSuccessAll({required this.notes});
}

final class ReadNoteCubitSuccessOne extends ReadNoteCubitState {
  final NoteModel note;
  ReadNoteCubitSuccessOne({required this.note});
}

final class ReadNoteCubitFailure extends ReadNoteCubitState {
  final String message;
  ReadNoteCubitFailure({required this.message});
}
