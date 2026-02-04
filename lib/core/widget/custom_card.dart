import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_text.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.h,
    required this.w,
  });

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: h*0.01),
      child: Container(
        height: h * 0.14,
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
              padding: EdgeInsets.only(top: h * 0.01, left: h * 0.01,bottom: h*0.01),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(70),
                child: Image.asset("assets/image/logo.png"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: h*0.02,left: w*0.02),
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
                              title: "Seller name",
                            ),
                            SizedBox(width: h * 0.01),
                            SvgPicture.asset("assets/image/mark.svg"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.02),
                  Row(
                    children: [
                      SvgPicture.asset("assets/image/motore.svg"),
                      CustomText(
                        fontSize: h * 0.012,
                        color: ColorApp.gray,
                        title: " Delivery Charges : 0.5 KD",
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.02),
                  Row(
                    children: [
                      SizedBox(width: w * 0.05),
                      SvgPicture.asset("assets/image/point.svg"),
                      SizedBox(width: w * 0.01),
                      CustomText(
                        fontSize: h * 0.013,
                        color: ColorApp.green,
                        title: "open",
                        fontFamily: false,
                      ),
                      SizedBox(width: w*0.05,),
                      SvgPicture.asset("assets/image/point.svg"),
                      SizedBox(width: w * 0.01),
                      CustomText(
                        fontSize: h * 0.013,
                        color: ColorApp.green,
                        title: "Beverages",
                        fontFamily: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left:w*0.05,top: h*0.026 ),
              child: Column(
                children: [
                  CustomText(
                    fontSize: h * 0.015,
                    color: ColorApp.gray,
                    title: "4.9",
                  ),
                  SizedBox(height: h * 0.05),
                  Row(
                    children: [
                      CustomText(
                        fontSize: h * 0.015,
                        color: ColorApp.green,
                        title: "2.5 KM",
                      ),
                      SvgPicture.asset("assets/image/location.svg"),
                      SizedBox(width: w * 0.01),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
