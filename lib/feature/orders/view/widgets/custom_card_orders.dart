import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_text.dart';

class CustomCardOrders extends StatelessWidget {
  const CustomCardOrders({
    super.key,
    required this.h,
    required this.w,
  });

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: h * 0.01,left:h*0.02,right: h * 0.02 ),
      child: Container(
        height: h * 0.12,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              spreadRadius: 0.1,
              offset: Offset(0, 5),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(h*0.02),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(70),
                child: Image.asset("assets/image/status.png"),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: h * 0.02, ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              CustomText(
                                fontSize: h * 0.02,
                                color: Colors.black,
                                title: "#243188 - 37 KD",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: h * 0.01),
                    Row(
                      children: [
                        CustomText(
                          fontSize: h * 0.015,
                          color: ColorApp.gray,
                          title: " 9 Seb",
                        ),
                        SizedBox(width: w * 0.01),
                        SvgPicture.asset("assets/image/point.svg",height: h*0.01,),
                          CustomText(
                          fontSize: h * 0.015,
                          color: ColorApp.gray,
                          title: " 4 items",
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: w * 0.01),
                        CustomText(
                          fontSize: h * 0.015,
                          color: ColorApp.gray,
                          title: "Status :",
                        ),
                        CustomText(
                          fontSize: h * 0.013,
                          color: const Color.fromARGB(255, 218, 198, 23),
                          title: "  Delivering",
                          fontFamily: false,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(h * 0.02),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(70),
                child: Image.asset("assets/image/code.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
