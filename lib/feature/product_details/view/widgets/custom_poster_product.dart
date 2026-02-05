import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_text.dart';

class CustomPosterProduct extends StatelessWidget {
  const CustomPosterProduct({
    super.key,
    required this.h,
  });

  final double h;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/image/fruitShop.png"),
        Positioned(
          top: h * 0.02,
          left: h * 0.23,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            height: h * 0.035,
            width: h * 0.18,
            child: Center(
              child: CustomText(
                fontSize: h * 0.015,
                color: ColorApp.gray,
                title: "10% Off Discount",
                fontFamily: false,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
