part of 'write_note_cubit_cubit.dart';

@immutable
sealed class WriteNoteCubitState {}

final class WriteNoteCubitInitial extends WriteNoteCubitState {}
final class WriteNoteCubitLoading extends WriteNoteCubitState {}
final class WriteNoteCubitSuccess extends WriteNoteCubitState {}
final class WriteNoteCubitFailure extends WriteNoteCubitState {
  final String massage;
 WriteNoteCubitFailure(this.massage);
}
