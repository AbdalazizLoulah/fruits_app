import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/contact_us/view/widgets/contact_us_body.dart';
import 'package:fruits_app/feature/contact_us/view_model/cubit/contact_us_cubit.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) => ContactUsCubit(ApiService(dio: Dio())),
          child: ContactUsBody(),
        ),
      ),
    );
  }
}
