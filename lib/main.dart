import 'package:flutter/material.dart';
import 'package:idea_box_app/core/helper_functions/app_routes.dart';
import 'package:idea_box_app/views/splash_view.dart';

void main() {
  runApp(const IdeaBoxApp());
}

class IdeaBoxApp extends StatelessWidget {
  const IdeaBoxApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      home: SplashView(),
    );
  }
}
