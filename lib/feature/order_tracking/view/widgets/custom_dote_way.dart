import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_text.dart';

class CustomDoteWay extends StatelessWidget {
  const CustomDoteWay({
    super.key,
    required this.h,
    required this.w,
    required this.title,
    required this.des,
    required this.isDone,
    required this.addWay,
  });

  final double h;
  final double w;
  final String title;
  final String des;
  final bool isDone;
  final bool addWay;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: h * 0.04,
              height: h * 0.04,
              decoration: BoxDecoration(
                color:isDone? Colors.green :Colors.white,
                border: Border.all(color: Colors.green, width: 2),
                shape: BoxShape.circle,
              ),
            ),
            addWay==true?
              Container(width: 2, height: h * 0.08, color: Colors.green):SizedBox(height: h*0.07,),
          ],
        ),
        SizedBox(width: w * 0.05),
        Padding(
          padding: EdgeInsets.only(bottom: h * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                fontSize: h * 0.02,
                color: ColorApp.black,
                title: title,
              ),
              CustomText(
                fontSize: h * 0.018,
                color: ColorApp.gray,
                title: des,
                fontFamily: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
