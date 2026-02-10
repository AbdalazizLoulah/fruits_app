import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';

class CustomCircle extends StatelessWidget {
  const CustomCircle({super.key, required this.h, this.onTap,this.isSelect=false,});

  final double h;
  final void Function()? onTap;
  final bool isSelect;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: h * 0.03,
        width: h * 0.03,
        decoration: BoxDecoration(
          color:isSelect?ColorApp.green : Colors.white,
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
