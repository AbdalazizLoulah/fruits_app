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
                    title: "E Shopping",
                    des: "Explore op organic fruits & grab them",
                  ),
                  CustomBoardScreen(
                    title: "Delivery Arrived",
                    des: "Order is arrived at your Place",
                  ),
                  CustomBoardScreen(
                    title: "E Shopping",
                    des: "Order is arrived at your Place",
                  ),
                ],
              ),
            );
  }
}