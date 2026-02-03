import 'package:flutter/material.dart';
import 'package:fruits_app/feature/Auth/forgetPassword/view/widgets/forget_password_body.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ForgetPasswordBody(),
    );
  }
}