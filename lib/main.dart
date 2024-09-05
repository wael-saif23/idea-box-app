import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:idea_box_app/core/constants/hive_constants.dart';
import 'package:idea_box_app/core/helper_functions/app_routes.dart';
import 'package:idea_box_app/core/helper_functions/app_style.dart';
import 'package:idea_box_app/model/note_model.dart';
import 'package:idea_box_app/model/note_model_Adaptor.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
 Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(HiveConstants.noteBox);
  runApp(const IdeaBoxApp());
}

class IdeaBoxApp extends StatelessWidget {
  const IdeaBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppStyle.themeData(),
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
