import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/category_item.dart';

class CustomListCategory extends StatelessWidget {
  const CustomListCategory({
    super.key,
    required this.h,
    required this.items,
  });

  final double h;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h * 0.10,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, count) {
          return CategoryItem(h: h, image: items[count]);
        },
      ),
    );
  }
}
