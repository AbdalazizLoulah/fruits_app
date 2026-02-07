import 'package:flutter/material.dart';
import 'package:fruits_app/feature/team&condition/view/widgets/team_and_condition_body.dart';

class TeamAndConditionScreen extends StatelessWidget {
  const TeamAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white
      ,body: TeamAndConditionBody(),
    );
  }
}