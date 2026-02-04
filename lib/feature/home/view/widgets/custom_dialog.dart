import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:go_router/go_router.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.h,
    required this.w,
  });

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: h * 0.49,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(h * 0.02),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CustomText(
                  fontSize: h * 0.027,
                  color: Colors.black,
                  title: "Filter by",
                ),
              ),
              SizedBox(height: h * 0.03),
              Row(
                children: [
                  CustomText(
                    fontSize: h * 0.02,
                    color: ColorApp.gray,
                    title: "Delivered To",
                    fontFamily: false,
                  ),
                  SizedBox(width: w * 0.02),
                  SvgPicture.asset(
                    "assets/image/motore.svg",
                    height: h * 0.02,
                  ),
                ],
              ),
              SizedBox(height: h * 0.02),
              Container(
                height: h * 0.06,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(
                        0.15,
                      ), // لون الظل
                      spreadRadius: 2, // مدى انتشار الظل
                      blurRadius: 10, // درجة التمويه
                      offset: Offset(
                        0,
                        0,
                      ), // تعيين الـ x و y للظل
                    ),
                  ],
                  border: Border.all(color: Colors.white),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: h * 0.01),
                  child: Row(
                    children: [
                      Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: ColorApp.gray,
                      ),
                      CustomText(
                        fontSize: h * 0.02,
                        color: Colors.black,
                        title: "AllAreas",
                        fontFamily: false,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    side: BorderSide(style: BorderStyle.solid),
                    value: false,
                    onChanged: (value) {},
                  ),
                  CustomText(
                  onTap: () => context.pop(),
                  fontSize: h * 0.02,
                  color: ColorApp.gray,
                  title: "Offers",
                  fontFamily: false,
                ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    side: BorderSide(style: BorderStyle.solid),
                    value: false,
                    onChanged: (value) {},
                  ),
                  
                  CustomText(
                    onTap: () => context.pop(),
                    fontSize: h * 0.02,
                    color: ColorApp.gray,
                    title: "Free Delivery",
                    fontFamily: false,
                  ),
                ],
              ),
              SizedBox(height: h * 0.01),
              CustomBottom(
                addBorder: false,
                width: w * 0.5,
                title: "Apply Filter",
                heightBottom: h * 0.055,
                heightText: h * 0.02,
                colorBottom: ColorApp.green,
                colorText: Colors.white,
              ),
              SizedBox(height: h * 0.03),
              Center(
                child: CustomText(
                  onTap: () => context.pop(),
                  fontSize: h * 0.026,
                  color: ColorApp.gray,
                  title: "Close",
                  fontFamily: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
