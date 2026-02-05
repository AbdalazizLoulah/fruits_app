import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/core/widget/custom_link_page.dart';
import 'package:fruits_app/core/widget/custom_name_app.dart';
import 'package:fruits_app/core/widget/custom_phone_text_field.dart';
import 'package:fruits_app/core/widget/custom_text_form_field.dart';
import 'package:go_router/go_router.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    var h = MediaQuery.of(context).size.height;
    return Container(
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
                fontSize: h * 0.02,
                helper: "Full name *",
                hint: "First And Last Name",
                controller: nameController,
              ),
              SizedBox(height: h * 0.02),
              CustomPhoneTextField(
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
                fontSize: h * 0.02,
                helper: "Password *",
                hint: "Password",
                controller: passwordController,
              ),
              SizedBox(height: h * 0.04),
              CustomBottom(
                width: double.infinity,
                title: "Sign Up",
                heightBottom: h * 0.06,
                heightText: h * 0.02,
                colorBottom: ColorApp.green,
                colorText: Colors.white,
              ),
              SizedBox(height: h * 0.05,),
              CustomLinkPage(
                onTap: () => context.go('/logIn'),
                height: h*0.02, title: "Already have an account? ", link: "Login")
            ],
          ),
        ),
      ),
    );
  }
}
