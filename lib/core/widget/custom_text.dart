import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.fontSize,
    required this.color,
    required this.title, required this.family,
  });
  final double fontSize;
  final Color color;
  final String title;
  final String family;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(color: color, fontSize: fontSize, fontFamily: family),
    );
  }
}
