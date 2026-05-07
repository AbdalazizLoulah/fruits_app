import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/Auth/logIn/data/repo/log_in_repo_implementation.dart';
import 'package:fruits_app/feature/Auth/logIn/view/widgets/log_in_body.dart';
import 'package:fruits_app/feature/Auth/logIn/view_model/sign_in/cubit/sign_in_cubit.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => SignInCubit(
          LogInRepoImplementation(apiService: ApiService(dio: Dio())),
        ),
        child: LogInBody(),
      ),
    );
  }
}
