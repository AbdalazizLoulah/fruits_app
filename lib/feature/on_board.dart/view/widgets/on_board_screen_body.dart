import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:fruits_app/feature/on_board.dart/view/widgets/custom_on_borde.dart';
import 'package:fruits_app/feature/on_board.dart/view/widgets/skip_bottom.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardScreenBody extends StatefulWidget {
  const OnBoardScreenBody({super.key});

  @override
  State<OnBoardScreenBody> createState() => _OnBoardScreenBodyState();
}

class _OnBoardScreenBodyState extends State<OnBoardScreenBody> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int page = _pageController.page!.round(); // صفحة تقريبية
      if (currentIndex != page) {
        setState(() {
          currentIndex = page;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(height: h * 0.07),
            if (currentIndex < 2) SkipBottom(onTap: ()=>context.go('/welcome'),) else SizedBox(height: h * 0.09),
            SizedBox(height: h * 0.03),
            CustomOnBoard(pageController: _pageController),
            SizedBox(height: h * 0.06),
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: WormEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: ColorApp.green,
              ),
            ),
            SizedBox(height: h * 0.06),
            GestureDetector(
              onTap: () {
                
                if (currentIndex < 2) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  context.go('/welcome');
                }
              },
              child: Container(
                height: h * 0.06,
                width: h * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: ColorApp.green,
                ),
                child: Center(
                  child: CustomText(
                    fontSize: h * 0.02,
                    color: Colors.white,
                    title: currentIndex == 2 ? "Get Started" : "Next",
                    family: "Poppins",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
