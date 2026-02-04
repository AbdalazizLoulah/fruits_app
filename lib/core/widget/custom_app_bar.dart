import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Container(
      height: h * 0.06,
      child: Row(
        children: [
          Expanded(
            child: CustomText(
              fontSize: h * 0.03,
              color: ColorApp.green,
              title: "Fruit Market",
            ),
          ),
          Container(
            child: Row(
              children: [
                Icon(Icons.search, color: ColorApp.green),
                Icon(Icons.tune, color: ColorApp.green),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
