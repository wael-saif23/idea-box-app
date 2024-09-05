import 'package:flutter/material.dart';

import 'package:idea_box_app/controller/splash_image_controller.dart';
import 'package:idea_box_app/core/helper_functions/app_routes.dart';

import 'package:idea_box_app/views/widgets/custom_splash_Image.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashImageController _splashImageController = SplashImageController();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 750), () {
      _splashImageController.changeContainerAttrbutes();
    });
    Future.delayed(const Duration(milliseconds: 2500), () {
      Navigator.pushReplacementNamed(context, AppRoutes.homeView);
    });
  }

  @override
  void dispose() {
    _splashImageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomSplashImage(
          splashImageController: _splashImageController,
        ),
      ),
    );
  }
}
