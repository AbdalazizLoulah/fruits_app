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
    final orientation =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(fontSize:orientation? h * 0.016:h*0.03, color: colorTitle, title: title),
        Container(
          child: Row(
            children: [
              CustomText(
                fontSize:orientation? h * 0.017:h*0.03,
                color: colorTitle,
                title: price,
              ),
              CustomText(
                fontSize:orientation? h * 0.013:h*0.017,
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
