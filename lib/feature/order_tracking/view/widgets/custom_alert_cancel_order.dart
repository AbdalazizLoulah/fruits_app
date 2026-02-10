import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:fruits_app/core/widget/custom_text_form_field.dart';
import 'package:go_router/go_router.dart';

class CustomAlertCancelOrder extends StatelessWidget {
  const CustomAlertCancelOrder({
    super.key,
    required this.h,
    required this.controller,
    required this.w,
  });

  final double h;
  final TextEditingController controller;
  final double w;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: h * 0.4,
        child: Padding(
          padding: EdgeInsets.only(top: h * 0.01),
          child: Column(
            children: [
              CustomText(
                fontSize: h * 0.02,
                color: Colors.black,
                title: "Cancel Order",
              ),
              CustomTextFormField(
                fontSize: h * 0.015,
                helper: "Reason",
                hint: "",
                controller: controller,
                h: h,
              ),
              CustomTextFormField(
                fontSize: h * 0.015,
                helper: "Note",
                hint: "",
                controller: controller,
                h: h,
                maxLine: 2,
              ),
              SizedBox(height: h * 0.02),
              CustomBottom(
                width: w * 0.8,
                title: "Confirm Cancelation",
                heightBottom: h * 0.05,
                heightText: h * 0.02,
                colorBottom: ColorApp.green,
                colorText: Colors.white,
              ),
              SizedBox(height: h * 0.02),
              CustomText(
                onTap: () {
                  context.pop();
                },
                fontSize: h * 0.025,
                color: ColorApp.gray,
                title: "Close",
                fontFamily: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
