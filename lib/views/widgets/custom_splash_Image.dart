import 'package:flutter/material.dart';
import 'package:idea_box_app/controller/splash_image_controller.dart';
import 'package:idea_box_app/core/utils/styles/app_images.dart';

class CustomSplashImage extends StatefulWidget {
  const CustomSplashImage({super.key, required this.splashImageController});
  final SplashImageController splashImageController;
  @override
  State<CustomSplashImage> createState() => _CustomSplashImageState();
}

class _CustomSplashImageState extends State<CustomSplashImage> {
  @override
  void initState() {
    super.initState();
    
    widget.splashImageController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOut,
      height: widget.splashImageController.height,
      width: widget.splashImageController.width,
      child: Image.asset(
        
        AppImages.imagesToSplashView,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
