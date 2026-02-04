import 'package:flutter/material.dart';
import 'package:fruits_app/feature/home/view/widgets/custom_card_seller.dart';
import 'package:go_router/go_router.dart';

class CustomListViewSeller extends StatelessWidget {
  const CustomListViewSeller({
    super.key,
    required this.h,
    required this.w,
    required this.itemCount,
  });

  final double h;
  final double w;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h * 0.4,
      child: ListView.builder(
        padding: EdgeInsets.only(top: h * 0.01),
        itemCount: itemCount,
        itemBuilder: (context, count) {
          return GestureDetector(
            onTap: () {
              context.go('/detailsSeller');
            },
            child: CustomCardSeller(h: h, w: w),
          );
        },
      ),
    );
  }
}
