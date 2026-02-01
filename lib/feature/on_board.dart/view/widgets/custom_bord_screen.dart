import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_text.dart';

class CustomBoardScreen extends StatelessWidget {
  const CustomBoardScreen({super.key, required this.title, required this.des});
  final String title;
  final String des;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          Image.asset(height: h * 0.3, "assets/image/on_boarde.png"),
          SizedBox(height: h * 0.03),
          CustomText(
            fontSize: h * 0.03,
            color: ColorApp.black,
            title: title,
            family: "Poppins",
          ),
          SizedBox(height: h * 0.01),
          CustomText(
            fontSize: h * 0.02,
            color: ColorApp.openGray,
            title: des,
            family: "Poppins",
          ),
        ],
      ),
    );
  }
}
