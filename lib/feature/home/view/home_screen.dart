import 'package:flutter/material.dart';
import 'package:fruits_app/feature/home/view/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: HomeBody(),);
  }
}