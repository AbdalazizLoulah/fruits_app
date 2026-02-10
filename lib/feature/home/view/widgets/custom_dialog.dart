import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/core/widget/custom_circle.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:go_router/go_router.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({super.key, required this.h, required this.w});

  final double h;
  final double w;

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  bool isSelect1 = false;
  bool isSelect2 = false;
  bool areas = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: widget.h * 0.49,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(widget.h * 0.02),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: CustomText(
                  fontSize: widget.h * 0.027,
                  color: Colors.black,
                  title: "Filter by",
                ),
              ),
              SizedBox(height: widget.h * 0.03),
              Row(
                children: [
                  CustomText(
                    fontSize: widget.h * 0.02,
                    color: ColorApp.gray,
                    title: "Delivered To",
                    fontFamily: false,
                  ),
                  SizedBox(width: widget.w * 0.02),
                  SvgPicture.asset(
                    "assets/image/motore.svg",
                    height: widget.h * 0.02,
                  ),
                ],
              ),
              SizedBox(height: widget.h * 0.02),
              GestureDetector(
                onTap: () {
                  setState(() {
                    areas = !areas;
                  });
                },
                child: Container(
                  height: widget.h * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15), // لون الظل
                        spreadRadius: 2, // مدى انتشار الظل
                        blurRadius: 10, // درجة التمويه
                        offset: Offset(0, 0), // تعيين الـ x و y للظل
                      ),
                    ],
                    border: Border.all(color: Colors.white),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: widget.h * 0.01),
                    child: Row(
                      children: [
                        Icon(
                          areas
                              ? Icons.keyboard_arrow_down_sharp
                              : Icons.keyboard_arrow_up,
                          color: ColorApp.gray,
                        ),
                        CustomText(
                          fontSize: widget.h * 0.02,
                          color: Colors.black,
                          title: "AllAreas",
                          fontFamily: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              areas? Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: CustomCircle(
                          h: widget.h * 0.5,
                          onTap: () {
                            setState(() {
                              isSelect1 = true;
                              isSelect2 = false;
                            });
                          },
                          isSelect: isSelect1,
                        ),
                      ),

                      CustomText(
                        onTap: () {
                          setState(() {
                            isSelect1 = true;
                            isSelect2 = false;
                          });
                        },
                        fontSize: widget.h * 0.02,
                        color: ColorApp.gray,
                        title: "Offers",
                        fontFamily: false,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: CustomCircle(
                          h: widget.h * 0.5,
                          onTap: () {
                            setState(() {
                              isSelect1 = false;
                              isSelect2 = true;
                            });
                          },
                          isSelect: isSelect2,
                        ),
                      ),

                      CustomText(
                        onTap: () {
                          setState(() {
                            isSelect1 = false;
                            isSelect2 = true;
                          });
                        },
                        fontSize: widget.h * 0.02,
                        color: ColorApp.gray,
                        title: "Free Delivery",
                        fontFamily: false,
                      ),
                    ],
                  ),
                ],
              ):SizedBox(),
              SizedBox(height: widget.h * 0.01),
              CustomBottom(
                onTap: () => context.pop(),
                addBorder: false,
                width: widget.w * 0.5,
                title: "Apply Filter",
                heightBottom: widget.h * 0.055,
                heightText: widget.h * 0.02,
                colorBottom: ColorApp.green,
                colorText: Colors.white,
              ),
              SizedBox(height: widget.h * 0.03),
              Center(
                child: CustomText(
                  onTap: () => context.pop(),
                  fontSize: widget.h * 0.026,
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
