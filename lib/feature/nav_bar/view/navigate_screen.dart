import 'package:flutter/material.dart';
import 'package:fruits_app/feature/nav_bar/view/widgets/custom_bottom_nav.dart';

class NavigateScreen extends StatelessWidget {
  const NavigateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomNav();
    // return Scaffold(
    //   bottomNavigationBar: CustomBottomNav(),
    // );
  }
}
