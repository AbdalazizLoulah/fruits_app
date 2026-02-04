import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/category_item.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/core/widget/custom_list_category.dart';
import 'package:fruits_app/core/widget/custom_list_view.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:fruits_app/feature/home/view/widgets/custom_slider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      "assets/image/restorant.png",
      "assets/image/cafe.png",
      "assets/image/clinec.png",
      "assets/image/farm.png",
    ];
    PageController _pageController = PageController();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: h * 0.02),
        child: Column(
          children: [
            SizedBox(height: h * 0.05),
            CustomAppBar(),
            SizedBox(height: h * 0.02),
            CustomSlider(h: h, pageController: _pageController),
            SizedBox(height: h * 0.02),
            CustomListCategory(h: h, items: items),
            SizedBox(height: h * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  fontSize: h * 0.021,
                  color: Colors.black,
                  title: "Sellers",
                ),
                CustomText(
                  fontSize: h * 0.02,
                  color: ColorApp.blue,
                  title: "Show all",
                  fontFamily: false,
                ),
              ],
            ),
            CustomListView(h: h, w: w),
          ],
        ),
      ),
    );
  }
}
