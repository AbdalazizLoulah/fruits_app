import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          SizedBox(height: h * 0.05),
          CustomAppBar(
            title: "Product Name",
            centerTitle: true,
            addIcons: false,
            icon1: Icons.favorite_border,
            icon2: Icons.ios_share,
          ),
        ],
      ),
    );
  }
}
