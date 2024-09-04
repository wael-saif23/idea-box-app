import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:idea_box_app/controller/splash_image_controller.dart';
import 'package:idea_box_app/core/utils/styles/app_images.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});


  @override
  State<SplashView> createState() => _SplashViewState();
}



class _SplashViewState extends State<SplashView> {

  @override
void initState() {
  super.initState();
  
} 


  final SplashImageController splashImageController = SplashImageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          child: Image.asset(
            AppImages.imagesToSplashView,
            height: splashImageController.height,
          ),
        ),
      ),
    );
  }
}
