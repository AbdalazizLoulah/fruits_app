import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/feature/splash/view/widget/splash_screen_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.green,
      body: SplashScreenBody(),
    );
  }
}