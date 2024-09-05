import 'package:hive_flutter/hive_flutter.dart';
import 'package:idea_box_app/model/note_model.dart';

class NoteModelAdapter extends TypeAdapter<NoteModel> {
  @override
  NoteModel read(BinaryReader reader) {
    return NoteModel(
      idAtDatabase: reader.readInt(),
      title: reader.readString(),
      description: reader.readString(),
      colorCode: reader.readInt(),
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, NoteModel obj) {
    writer.writeInt(obj.idAtDatabase);
    writer.writeString(obj.title);
    writer.writeString(obj.description);
    writer.writeInt(obj.colorCode);  
  }
}
