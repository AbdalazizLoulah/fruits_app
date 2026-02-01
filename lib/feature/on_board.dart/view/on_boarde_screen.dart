import 'package:flutter/material.dart';
import 'package:fruits_app/feature/on_board.dart/view/widgets/on_board_screen_body.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardScreenBody(),
    );
  }
}