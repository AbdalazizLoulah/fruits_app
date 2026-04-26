import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/core/widget/custom_link_page.dart';
import 'package:fruits_app/core/widget/custom_name_app.dart';
import 'package:fruits_app/core/widget/custom_phone_text_field.dart';
import 'package:fruits_app/core/widget/custom_text_form_field.dart';
import 'package:fruits_app/feature/Auth/signUp/view_body/sign_up/cubit/sign_up_cubit.dart';
import 'package:go_router/go_router.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Form(
      key: key,
      child: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: h * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: h * 0.08),
                  GestureDetector(
                    onTap: () => context.go('/logIn'),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  SizedBox(height: h * 0.08),
                  CustomNameApp(des: "Sign Up to Wikala"),
                  SizedBox(height: h * 0.04),
                  CustomTextFormField(
                    validator: (name) {
                      if (name == null || name.isEmpty) {
                        return "Pleas enter your name";
                      }
                      if (name.length < 3) {
                        return "your name is short";
                      }
                      return null;
                    },
                    h: h,
                    fontSize: h * 0.02,
                    helper: "Full name *",
                    hint: "First And Last Name",
                    controller: nameController,
                  ),
                  SizedBox(height: h * 0.02),
                  CustomPhoneTextField(
                    helper: "Phone Number *",
                    validator: (phone) {
                      if (phone == null || phone.number.isEmpty) {
                        return "Please enter your phone number";
                      }
                      if (phone.number.length > 10) {
                        return 'confirm number is not valid';
                      }
                      return null;
                    },
                    controller: phoneController,
                  ),
                  SizedBox(height: h * 0.02),
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }
                      if (value.length < 8) {
                        return "The password is short";
                      }
                      return null;
                    },
                    h: h,
                    fontSize: h * 0.02,
                    helper: "Password *",
                    hint: "Password",
                    controller: passwordController,
                  ),
                  SizedBox(height: h * 0.04),
                  BlocConsumer<SignUpCubit, SignUpState>(
                    listener: (context, state) {
                      if (state is SignUpFailure) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Error"),
                            icon: Icon(Icons.error),
                            content: Container(
                              height: h * 0.05,
                              width: h * 0.05,
                              child: Column(
                                children: [
                                  Text(
                                    state.massage,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                      if (state is SignUpSuccess) {
                        var d = state.data;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            onVisible: () {
                              if (d.status == false) {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text("Error"),
                                    icon: Icon(Icons.error),
                                    content: Container(
                                      height: h * 0.07,
                                      width: h * 0.05,
                                      child: Column(
                                        children: [
                                          Text(
                                            d.errorMessage.toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                context.go("/logIn");
                              }
                            },
                            content: d.status? Text('تم التسجيل')
                                :Text("${d.errorMessage}"),
                            backgroundColor: d.status == true
                                ? Colors.green
                                : Colors.red,
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is SignUpLoading) {
                        return Container(
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      return GestureDetector(
                        onTap: () {
                          if (key.currentState != null &&
                              key.currentState!.validate()) {
                            context.read<SignUpCubit>().signUp(
                              name: nameController.text,
                              num: phoneController.text,
                              password: passwordController.text,
                            );
                            log("${nameController.text}");
                            log("${phoneController.text}");
                            log("${passwordController.text}");
                          }
                          log("done");
                        },
                        child: CustomBottom(
                          width: double.infinity,
                          title: "Sign Up",
                          heightBottom: h * 0.06,
                          heightText: h * 0.02,
                          colorBottom: ColorApp.green,
                          colorText: Colors.white,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: h * 0.05),
                  CustomLinkPage(
                    onTap: () => context.go('/logIn'),
                    height: h * 0.02,
                    title: "Already have an account? ",
                    link: "Login",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
