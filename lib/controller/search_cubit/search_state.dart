part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchFailure extends SearchState {
  final String message;
  SearchFailure({required this.message});
}

final class SearchSuccessWithNOItems extends SearchState {
  final String message;
  SearchSuccessWithNOItems({required this.message});
}

final class SearchSuccessInSubject extends SearchState {
  final List<NoteModel> notes;
  SearchSuccessInSubject({required this.notes});
}

final class SearchSuccessInDescription extends SearchState {
  final List<NoteModel> notes;
  SearchSuccessInDescription({required this.notes});
}
