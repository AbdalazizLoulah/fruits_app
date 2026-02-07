import 'package:flutter/material.dart';

class CustomSocial extends StatelessWidget {
  const CustomSocial({
    super.key,
    required this.h,
    required this.w,
    required this.icon, required this.colorIcon,
  });

  final double h;
  final double w;
  final IconData icon;
  final Color colorIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: h * 0.065,
        width: w * 0.14,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(),
        ),
        child: Icon(icon, size: h * 0.04, color: colorIcon),
      ),
    );
  }
}
