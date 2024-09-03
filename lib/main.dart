import 'package:flutter/material.dart';
import 'package:idea_box_app/core/helper_functions/app_routes.dart';
import 'package:idea_box_app/core/helper_functions/app_style.dart';

void main() {
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
