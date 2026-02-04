import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:fruits_app/core/widget/custom_text.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({
    super.key,
    this.onTap,
    required this.width,
    required this.title,
    this.currentIndex,
    required this.heightBottom,
    required this.heightText,
    required this.colorBottom,
    required this.colorText,
    this.icon,
    this.addIcon = false,this.addBorder=true,
  });
  final void Function()? onTap;
  final double heightBottom;
  final double width;
  final String title;
  final double heightText;
  final int? currentIndex;
  final Color colorBottom;
  final Color colorText;
  final IconData? icon;
  final bool addIcon;
  final bool addBorder;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: heightBottom,
          width: width,
          decoration: BoxDecoration(
            border:addBorder? Border.all(color: Colors.grey):Border(),
            borderRadius: BorderRadius.circular(30),
            color: colorBottom,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                addIcon
                    ? SvgPicture.asset("assets/image/google_logo.svg")
                    : SizedBox(),
                icon == null
                    ? SizedBox()
                    : Icon(icon, size: heightText + 4, color: colorText),
                SizedBox(width: 3),
                CustomText(
                  fontSize: heightText,
                  color: colorText,
                  title: title,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
