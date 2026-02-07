import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.fontSize,
    required this.helper,
    required this.hint,
    required this.controller,
    this.validator,
    this.obscureText = false,
    required this.h, this.maxLine=1,
  });
  final double fontSize;
  final String helper;
  final String hint;
  final double h;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final int maxLine;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(fontSize: fontSize, color: ColorApp.openGray, title: helper),
        SizedBox(height: h * 0.01),
        TextFormField(
          maxLines: maxLine,
          obscureText: obscureText,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            hint: Text(hint),
            hintStyle: TextStyle(color: ColorApp.gray),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(25),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey,width: 2),
              borderRadius: BorderRadius.circular(25),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ],
    );
  }
}
