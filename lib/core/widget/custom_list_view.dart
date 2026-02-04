import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/custom_card.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.h,
    required this.w,
  });

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h*0.4,
      child: ListView.builder(
        padding: EdgeInsets.only(top: h*0.01),
        itemCount: 3,
        itemBuilder: (context, count) {
          return CustomCard(h: h, w: w);
        },
      ),
    );
  }
}
