import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.fontSize,
    required this.color,
    required this.title,
    this.fontFamily=true,
  });
  final double fontSize;
  final Color color;
  final String title;
  final bool fontFamily;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(color: color, fontSize: fontSize, fontFamily:fontFamily? "Bold":"Regular"),
    );
  }
}
