import 'package:flutter/material.dart';
import 'package:fruits_app/feature/profile/view/widgets/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,body: ProfileBody(),);
  }
}
