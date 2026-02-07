import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/core/widget/custom_phone_text_field.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:fruits_app/core/widget/custom_text_form_field.dart';
import 'package:go_router/go_router.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    var h = MediaQuery.of(context).size.height;
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: h * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h * 0.1),
            GestureDetector(
              onTap: () {
                context.go('/nav');
              },
              child: Icon(Icons.arrow_back_ios, size: h * 0.03),
            ),
            SizedBox(height: h * 0.06),
            Center(
              child: Stack(
                children: [
                  Container(
                    height: h * 0.1,
                    width: h * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.green, width: 2),
                    ),
                  ),
                  Positioned(
                    left: h * 0.063,
                    top: h * 0.065,
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: h * 0.04,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: h * 0.03),
            Center(
              child: CustomText(
                fontSize: h * 0.03,
                color: Colors.black,
                title: "Welcome, Ahmed",
                fontFamily: false,
              ),
            ),
            SizedBox(height: h * 0.03),
            CustomTextFormField(
              fontSize: h * 0.02,
              helper: "Full name *",
              hint: "First and Last Name",
              controller: nameController,
              h: h,
            ),
            SizedBox(height: h * 0.01),
            CustomPhoneTextField(
              helper: "Phone Number with Whatsapp *",
              controller: phoneController,
              validator: (value) {
                return "enter number";
              },
            ),
            SizedBox(height: h * 0.01),
            CustomTextFormField(
              fontSize: h * 0.02,
              helper: "Password *",
              hint: "Password",
              controller: nameController,
              h: h,
            ),
            SizedBox(height: h * 0.03),
            CustomBottom(
              width: double.infinity,
              title: "Update",
              heightBottom: h * 0.06,
              heightText: h * 0.02,
              colorBottom: ColorApp.green,
              colorText: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
