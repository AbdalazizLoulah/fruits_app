import 'package:flutter/material.dart';
import 'package:fruits_app/feature/nav_bar/view/widgets/custom_bottom_nav.dart';

class NavigateScreen extends StatelessWidget {
  const NavigateScreen({super.key, required this.currentIndex});
    final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return CustomBottomNav(currentIndex: currentIndex,);
  
  }
}
