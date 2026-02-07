import 'package:flutter/material.dart';
import 'package:fruits_app/feature/contact_us/view/widgets/contact_us_body.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ContactUsBody(),
    );
  }
}