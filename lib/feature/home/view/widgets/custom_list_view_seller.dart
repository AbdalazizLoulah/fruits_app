import 'package:flutter/material.dart';
import 'package:fruits_app/feature/home/view/widgets/custom_card_seller.dart';
import 'package:go_router/go_router.dart';

class CustomListViewSeller extends StatelessWidget {
  const CustomListViewSeller({
    super.key,
    required this.h,
    required this.w,
    required this.itemCount,this.orientation=false,
  });

  final double h;
  final double w;
  final int itemCount;
  final bool orientation;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h * 0.4,
      child:orientation? ListView.builder(
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
      ):Padding(
        padding:  EdgeInsets.only(top:  h * 0.02),
        child: GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  childAspectRatio: 6,
        ),itemCount: itemCount,itemBuilder:(context,count)=> GestureDetector(
          onTap: () {
                    context.go('/detailsSeller');
                  },
          child: CustomCardSeller(h: h, w: w)),),
      ),
    );
  }
}
