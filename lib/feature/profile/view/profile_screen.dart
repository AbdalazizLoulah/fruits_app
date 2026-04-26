import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/profile/view/widgets/profile_body.dart';
import 'package:fruits_app/feature/profile/view_model/profile/cubit/get_profile_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) => GetProfileCubit(ApiService(dio: Dio())),
          child: ProfileBody(),
        ),
      ),
    );
  }
}
