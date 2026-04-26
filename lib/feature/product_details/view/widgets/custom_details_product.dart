import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_text.dart';

class CustomDetailsProduct extends StatelessWidget {
  const CustomDetailsProduct({super.key, required this.h,  this.orientation=false});

  final double h;
  final bool orientation;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              fontSize:orientation? h * 0.018:h*0.025,
              color: ColorApp.green,
              title: "Category Name",
            ),
            CustomText(
              fontSize:orientation? h * 0.024:h*0.03,
              color: Colors.black,
              title: "Product name",
            ),
          ],
        ),
        Column(
          children: [
            CustomText(
              fontSize: orientation ? h * 0.018 : h * 0.025,
              color: ColorApp.gray,
              title: "Price",
              fontFamily: false,
            ),
            Row(
              children: [
                CustomText(
                  fontSize: orientation ? h * 0.024 : h * 0.03,
                  color: ColorApp.gray,
                  title: "KD12.00 ",
                ),
                CustomText(
                  fontSize: orientation ? h * 0.015 : h * 0.02,
                  color: Colors.redAccent,
                  title: " KD14.00",
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
