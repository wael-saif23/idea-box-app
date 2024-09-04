import 'package:flutter/material.dart';

class SplashImageController extends ChangeNotifier {
  double height = 500;
  

  void changeContainerAttrbutes() {
    height = 0;
    

    notifyListeners();
  }
}
