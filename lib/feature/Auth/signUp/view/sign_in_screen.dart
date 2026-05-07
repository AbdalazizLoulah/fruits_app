import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/Auth/signUp/data/repo/sign_up_repo_implementation.dart';
import 'package:fruits_app/feature/Auth/signUp/view/widgets/sign_in_body.dart';
import 'package:fruits_app/feature/Auth/signUp/view_body/sign_up/cubit/sign_up_cubit.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignUpCubit(
          SignUpRepoImplementation(apiService: ApiService(dio: Dio())),
        ),
        child: SignInBody(),
      ),
    );
  }
}
