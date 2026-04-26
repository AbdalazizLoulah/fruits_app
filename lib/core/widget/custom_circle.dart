import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';

class CustomCircle extends StatelessWidget {
  const CustomCircle({super.key, required this.h, this.onTap,this.isSelect=false,});

  final double h;
  final void Function()? onTap;
  final bool isSelect;
  @override
  Widget build(BuildContext context) {
    final orientation =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height:orientation? h * 0.03:h*0.04,
        width: orientation ? h * 0.03 : h * 0.04,
        decoration: BoxDecoration(
          color:isSelect?ColorApp.green : Colors.white,
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
