import 'package:flutter/material.dart';
import 'package:fruits_app/feature/Auth/signUp/view/widgets/sign_in_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInBody(),
    );
  }
}