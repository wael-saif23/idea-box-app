import 'package:flutter/material.dart';
import 'package:idea_box_app/views/splash_view.dart';

class AppRoutes {
  static const String splash = '/';
  
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),);
      
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),);}}}