import 'package:flutter/material.dart';

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
    final orientation =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      child: Column(
        children: [
          Container(
            height:orientation? h*0.15:h*0.2,
            width: double.infinity,
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
                      
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(15),
                      child: Image.asset("assets/image/slider.png",fit: BoxFit.fill,)),
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
