import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/core/widget/custom_link_page.dart';
import 'package:fruits_app/core/widget/custom_name_app.dart';
import 'package:fruits_app/core/widget/custom_phone_text_field.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:fruits_app/core/widget/custom_text_form_field.dart';
import 'package:fruits_app/feature/Auth/logIn/view_model/sign_in/cubit/sign_in_cubit.dart';

import 'package:go_router/go_router.dart';

class LogInBody extends StatefulWidget {
  const LogInBody({super.key});

  @override
  State<LogInBody> createState() => _LogInBodyState();
}

class _LogInBodyState extends State<LogInBody> {
  final GlobalKey<FormState> key = GlobalKey();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  @override
  
  Future saveToken({required String token}) async {
    final storage = FlutterSecureStorage();
    await storage.write(key: 'token', value: token);
  }

  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Form(
      key: key,
      child: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: h * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: h * 0.08),
                GestureDetector(
                  onTap: () => context.go('/welcome'),
                  child: Icon(Icons.arrow_back_ios),
                ),
                SizedBox(height: h * 0.08),
                CustomNameApp(des: "Login to Wikala"),
                SizedBox(height: h * 0.02),
                CustomPhoneTextField(
                  helper: "Phone Number *",
                  controller: phoneController,
                  validator: (phone) {
                    if (phone == null || phone.number.isEmpty) {
                      return "Please enter your phone number";
                    }
                    if (phone.number.length > 10) {
                      return 'confirm number is not valid';
                    }
                    return null;
                  },
                ),
                SizedBox(height: h * 0.01),
                CustomTextFormField(
                  h: h,
                  obscureText: true,
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Inter Password";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    } else {
                      return null;
                    }
                  },
                  fontSize: h * 0.02,
                  helper: "Password *",
                  hint: "Password",
                ),
                SizedBox(height: h * 0.015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.go('/forgetPassword');
                      },
                      child: CustomText(
                        fontSize: h * 0.017,
                        color: ColorApp.blue,
                        title: "Forget Password?",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: h * 0.03),
                BlocConsumer<SignInCubit, SignInState>(
                  listener: (context, state) {
                    if (state is SignInSuccess) {
                      var d = state.data;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          onVisible: () {
                            if (d.status == false) {
                            } else {
                              saveToken(token: "${d.data!.token}");
                              context.go('/nav', extra: 0);
                            }
                          },
                          content: d.status
                              ? Text('Success')
                              : Text('${d.message}'),
                          backgroundColor: d.status ? Colors.green : Colors.red,
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is SignInLoading) {
                      return Container(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    return CustomBottom(
                      onTap: () {
                        if (key.currentState!.validate()) {
                          context.read<SignInCubit>().logIn(
                            phone: phoneController.text,
                            password: passwordController.text,
                          );
                          // context.go('/nav', extra: 0);
                        }
                      },
                      width: double.infinity,
                      title: " Login ",
                      heightBottom: h * 0.06,
                      heightText: h * 0.02,
                      colorBottom: ColorApp.green,
                      colorText: Colors.white,
                    );
                  },
                ),
                SizedBox(height: h * 0.03),
                CustomLinkPage(
                  onTap: () => context.go('/signUp'),
                  height: h * 0.02,
                  title: "Don’t have an account? ",
                  link: "Sign up",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
