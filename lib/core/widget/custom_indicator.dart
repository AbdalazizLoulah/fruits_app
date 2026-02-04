import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key, required PageController pageController, required this.count})
    : _pageController = pageController;

  final PageController _pageController;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: _pageController,
      count: count,
      effect: WormEffect(
        dotHeight: 8,
        dotWidth: 8,
        activeDotColor: ColorApp.green,
      ),
    );
  }
}
