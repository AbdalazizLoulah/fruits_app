import 'package:flutter/material.dart';
import 'package:fruits_app/feature/welcom/view/widget/welcome_screen_body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomeScreenBody(),
    );
  }
}