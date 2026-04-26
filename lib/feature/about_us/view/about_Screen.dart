import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/about_us/view/widget/about_body.dart';
import 'package:fruits_app/feature/about_us/view_model/about_us/cubit/about_us_cubit.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => AboutUsCubit(ApiService(dio: Dio())),
          child: AboutBody(),
        ),
      ),
    );
  }
}
