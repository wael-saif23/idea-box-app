import 'package:bloc/bloc.dart';
import 'package:idea_box_app/model/note_model.dart';
import 'package:meta/meta.dart';

part 'read_note_cubit_state.dart';

class ReadNoteCubitCubit extends Cubit<ReadNoteCubitState> {
  ReadNoteCubitCubit() : super(ReadNoteCubitInitial());
}
