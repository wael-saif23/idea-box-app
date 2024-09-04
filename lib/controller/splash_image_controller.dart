import 'package:flutter/material.dart';

class SplashImageController extends ChangeNotifier {
  double height = 500;
  double width = 500;
  void changeContainerAttrbutes() {
    height = 0;
    width = 0;
    notifyListeners();
  }
}
