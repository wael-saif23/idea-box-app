part of 'read_note_cubit_cubit.dart';

@immutable
sealed class ReadNoteCubitState {}

final class ReadNoteCubitInitial extends ReadNoteCubitState {}
final class ReadNoteCubitLoading extends ReadNoteCubitState {}
final class ReadNoteCubitSuccess extends ReadNoteCubitState {
  final List<NoteModel> notes;
  ReadNoteCubitSuccess({required this.notes});
}
final class ReadNoteCubitFailure extends ReadNoteCubitState {
  final String message;
  ReadNoteCubitFailure({required this.message});
}

