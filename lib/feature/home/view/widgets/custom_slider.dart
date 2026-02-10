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
    return Container(
      child: Column(
        children: [
          Container(
            height: h*0.15,
            width: h*0.5,
            child: PageView.builder(
              controller: _pageController,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: h * 0.02),
                  child: Container(
                    height: h * 0.10,
                    width: h * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorApp.openBlue,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: h * 0.02),
          CustomIndicator(pageController: _pageController, count: 4),
        ],
      ),
    );
  }
}
