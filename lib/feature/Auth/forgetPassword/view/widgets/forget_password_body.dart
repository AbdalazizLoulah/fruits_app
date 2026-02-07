import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/core/widget/custom_name_app.dart';
import 'package:fruits_app/core/widget/custom_phone_text_field.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
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
              CustomNameApp(des: "Enter your Number"),
              SizedBox(height: h * 0.04),
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
                controller: controller,
              ),
              SizedBox(height: h * 0.04),
              CustomBottom(
                onTap: () => context.go('/otp'),
                width: double.infinity,
                title: "Submit",
                heightBottom: h * 0.06,
                heightText: h * 0.02,
                colorBottom: ColorApp.green,
                colorText: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
