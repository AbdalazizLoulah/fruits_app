import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_text.dart';

class SkipBottom extends StatelessWidget {
  const SkipBottom( {  super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: h * 0.09,
            width: h * 0.06,
            child: Column(
              children: [
                CustomText(
                  fontSize: h * 0.025,
                  color: ColorApp.gray,
                  title: "Skip",
                  family: "Poppins",
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
