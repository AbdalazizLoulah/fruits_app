import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_text.dart';

class CustomTotal extends StatelessWidget {
  const CustomTotal({
    super.key,
    required this.h,
    required this.title,
    required this.price, required this.colorTitle,
  });

  final double h;
  final String title;
  final String price;
  final Color colorTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(fontSize: h * 0.016, color: colorTitle, title: title),
        Container(
          child: Row(
            children: [
              CustomText(
                fontSize: h * 0.017,
                color: colorTitle,
                title: price,
              ),
              CustomText(
                fontSize: h * 0.013,
                color: ColorApp.gray,
                title: "KD",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
