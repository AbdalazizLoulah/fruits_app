import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_circle.dart';
import 'package:fruits_app/core/widget/custom_text.dart';

class CustomCardAddress extends StatelessWidget {
  const CustomCardAddress({super.key, required this.h, this.isSelect = false, this.onTap});

  final double h;
  final bool isSelect;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      height: h * 0.2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: h * 0.02, vertical: h * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.location_on_outlined, size: h * 0.04),
                        CustomText(
                          fontSize: h * 0.018,
                          color: ColorApp.gray,
                          title: "Address 1",
                        ),
                      ],
                    ),
                  ),
                ),
                CustomCircle(h: h, isSelect: isSelect, onTap: onTap),
              ],
            ),
            CustomText(
              fontSize: h * 0.02,
              color: ColorApp.gray,
              title: "John Doe",
              fontFamily: false,
            ),
            CustomText(
              fontSize: h * 0.02,
              color: ColorApp.gray,
              title: "+000-11-1234567",
              fontFamily: false,
            ),
            SizedBox(height: h * 0.01),
            CustomText(
              fontSize: h * 0.015,
              color: ColorApp.gray,

              title:
                  '''Room # 1 - Ground Floor, Al Najoum Building, 24 B Street, Dubai - United Arab Emirates''',
              fontFamily: false,
            ),
          ],
        ),
      ),
    );
  }
}
