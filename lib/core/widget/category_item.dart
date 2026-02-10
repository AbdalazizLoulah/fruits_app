import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/custom_text.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.h, required this.image, required this.title});
  final double h;
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: h * 0.01, vertical: h * 0.01),
      child: Column(
        children: [
          Container(
            height: h * 0.09,
            width: h * 0.085,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 0.1,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(40),
              child: Image.asset(image, fit: BoxFit.fill),
            ),
          ),
          CustomText(fontSize: h * 0.016, color: Colors.black, title: title)
        ],
      ),
    );
  }
}
