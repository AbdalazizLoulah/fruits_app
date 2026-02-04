import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_text.dart';

class CustomProductCart extends StatelessWidget {
  const CustomProductCart({
    super.key,
    required this.h,
    required this.w,
  });

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: h * 0.01),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: h * 0.01),
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
                    padding: EdgeInsets.only(
                      top: h * 0.01,
                      left: h * 0.01,
                      bottom: h * 0.01,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(
                        50,
                      ),
                      child: Image.asset("assets/image/Fruits.png"),
                    ),
                  ),
                  SizedBox(width: w * 0.03),
                  Padding(
                    padding: EdgeInsets.only(top: h * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  CustomText(
                                    fontSize: h * 0.016,
                                    color: Colors.black,
                                    title: "Product name",
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
                              fontSize: h * 0.013,
                              color: ColorApp.gray,
                              title: " 12.00KD",
                            ),
                          ],
                        ),
                        SizedBox(height: h * 0.01),
                        Container(
                          height: h * 0.03,
                          width: w * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(
                              255,
                              215,
                              132,
                              126,
                            ),
                          ),
                          child: Center(
                            child: CustomText(
                              fontSize: h * 0.013,
                              color: Colors.white,
                              title: " Up to 10% Off",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: w * 0.04),
                  Image.asset(
                    "assets/image/pasket.png",
                    height: h * 0.07,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
