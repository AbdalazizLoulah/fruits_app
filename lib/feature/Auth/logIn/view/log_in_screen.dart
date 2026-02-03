import 'package:flutter/material.dart';
import 'package:fruits_app/feature/Auth/logIn/view/widgets/log_in_body.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LogInBody(),
    );
  }
}