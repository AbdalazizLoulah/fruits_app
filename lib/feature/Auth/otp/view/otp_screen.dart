import 'package:flutter/material.dart';
import 'package:fruits_app/feature/Auth/otp/view/widgets/otp_body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OtpBody(),
    );
  }
}