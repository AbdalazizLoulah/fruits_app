import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.fontSize,
    required this.color,
    required this.title,
    this.fontFamily = true, this.onTap,
  });
  final double fontSize;
  final Color color;
  final String title;
  final bool fontFamily;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: fontFamily ? "Bold" : "Regular",
        ),
      ),
    );
  }
}
