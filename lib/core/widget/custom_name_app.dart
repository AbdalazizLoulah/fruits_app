import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_text.dart';

class CustomNameApp extends StatelessWidget {
  const CustomNameApp({super.key, required this.des});
  final String des;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Center(
          child: CustomText(
            fontSize: h * 0.05,
            color: ColorApp.green,
            title: "Fruit Market",
          ),
        ),
        SizedBox(height: h * 0.02),
        Center(
          child: CustomText(
            fontSize: h * 0.03,
            color: Colors.black,
            title: des,
          ),
        ),
      ],
    );
  }
}
