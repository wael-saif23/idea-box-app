import 'package:flutter/material.dart';
import 'package:idea_box_app/views/add_note_view.dart';
import 'package:idea_box_app/views/details_view.dart';
import 'package:idea_box_app/views/home_view.dart';
import 'package:idea_box_app/views/splash_view.dart';

class AppRoutes {
  static const String splash = '/';
  static const String homeView = '/home view';
  static const String detailsView = '/details view';
  static const String addNoteView = '/add note view';  
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );

      case homeView:
        return MaterialPageRoute(
          builder: (context) =>const HomeView(),
        );

      case detailsView:
        return MaterialPageRoute(
          builder: (context) => const DetailsView(),
          settings: RouteSettings(arguments: settings.arguments),
        );

      case addNoteView:
        return MaterialPageRoute(
          builder: (context) => const AddNoteView(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
    }
  }
}
