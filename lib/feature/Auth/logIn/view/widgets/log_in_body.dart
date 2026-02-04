import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/core/widget/custom_link_page.dart';
import 'package:fruits_app/core/widget/custom_name_app.dart';
import 'package:fruits_app/core/widget/custom_phone_text_field.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:fruits_app/core/widget/custom_text_form_field.dart';

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
                CustomBottom(
                  onTap: () {
                    if (key.currentState!.validate()) {
                      context.go('/nav');
                    }
                  },
                  width: double.infinity,
                  title: " Login ",
                  heightBottom: h * 0.06,
                  heightText: h * 0.02,
                  colorBottom: ColorApp.green,
                  colorText: Colors.white,
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
