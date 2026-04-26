import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/feature/Auth/forgetPassword/view/widgets/forget_password_body.dart';
import 'package:fruits_app/feature/Auth/forgetPassword/view_model/auth_phone/cubit/auth_phone_cubit.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthPhoneCubit(),
        child: ForgetPasswordBody(),
      ),
    );
  }
}
