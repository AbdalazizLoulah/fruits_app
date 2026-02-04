import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_indicator.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
    required this.h,
    required PageController pageController,
  }) : _pageController = pageController;

  final double h;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: [
          Container(
            height: h * 0.17,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorApp.openBlue,
            ),
          ),
          SizedBox(height: h * 0.02),
          CustomIndicator(pageController: _pageController, count: 4),
        ],),);
  }
}
