import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/feature/on_board.dart/view/widgets/custom_bord_screen.dart';

class CustomOnBoard extends StatelessWidget {
  const CustomOnBoard({super.key, required this.pageController});
  
  final PageController pageController ;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Container(
              height: h*0.45,
              child: PageView(
                controller: pageController,
                children: [
                  CustomBoardScreen(
                    title: "onboard_title_1".tr(),
                    des: "onboard_desc_1".tr(),
                  ),
                  CustomBoardScreen(
                    title: "onboard_title_2".tr(),
                    des: "onboard_desc_2".tr(),
                  ),
                  CustomBoardScreen(
                    title: "onboard_title_3".tr(),
                    des: "onboard_desc_3".tr(),
                  ),
                ],
              ),
            );
  }
}