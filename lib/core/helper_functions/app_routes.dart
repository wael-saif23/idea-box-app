import 'package:flutter/material.dart';
import 'package:idea_box_app/views/home_view.dart';
import 'package:idea_box_app/views/splash_view.dart';

class AppRoutes {
  static const String splash = '/';
  static const String homeView = '/home view';
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),);

          case homeView:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),);
      
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),);}}}