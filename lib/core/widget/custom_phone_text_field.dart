import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:intl_phone_field/phone_number.dart';

class CustomPhoneTextField extends StatelessWidget {
  const CustomPhoneTextField({
    Key? key,
    required this.controller,
    this.validator,
  });
  final TextEditingController controller;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          fontSize: h * 0.02,
          color: ColorApp.openGray,
          title: "Phone Number *",
        ),
        SizedBox(height: h * 0.01),
            IntlPhoneField(
              autovalidateMode: AutovalidateMode.always,

              validator: validator,
          controller: controller,
          cursorColor: ColorApp.gray,
          showCountryFlag: false,
          onChanged: (value) {
            controller.text = value.number;
          },
          dropdownDecoration: BoxDecoration(shape: BoxShape.circle),
          initialCountryCode: 'EG',
          decoration: InputDecoration(
            hint: Text("Mobile Number"),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorApp.gray),
              borderRadius: BorderRadius.circular(25),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: ColorApp.gray),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          
        ),
      ],
    );
  }
}
