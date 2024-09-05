class NoteModel {
  final int idAtDatabase;
  final String title;
  final String description;
  final int colorCode;

  NoteModel({
    required this.colorCode,
    required this.title,
    required this.description,
    required this.idAtDatabase,
  });

  NoteModel decrementIdAtDatabase() {
    return NoteModel(
      idAtDatabase: idAtDatabase - 1,
      title: title,
      description: description,
      colorCode: colorCode,
    );
  }
}
