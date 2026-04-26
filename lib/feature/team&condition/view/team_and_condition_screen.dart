import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/team&condition/view/widgets/team_and_condition_body.dart';
import 'package:fruits_app/feature/team&condition/view_model/condition/cubit/condition_cubit.dart';

class TeamAndConditionScreen extends StatelessWidget {
  const TeamAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) => ConditionCubit(ApiService(dio: Dio())),
          child: TeamAndConditionBody(),
        ),
      ),
    );
  }
}
