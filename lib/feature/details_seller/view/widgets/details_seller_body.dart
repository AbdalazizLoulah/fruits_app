import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/core/widget/custom_list_category.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:fruits_app/feature/details_seller/view/widgets/custom_details_seller_cart.dart';
import 'package:fruits_app/feature/details_seller/view/widgets/custom_product_cart.dart';
import 'package:go_router/go_router.dart';

class DetailsSellerBody extends StatelessWidget {
  const DetailsSellerBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {"image": "assets/image/Fruits.png", "title": "Fruits"},
      {"image": "assets/image/vegetables.png", "title": "Vegetables"},
      {"image": "assets/image/phone.png", "title": "Photo"},
      {"image": "assets/image/animal.png", "title": "Pets"},
    ];
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          SizedBox(height: h * 0.05),
          CustomAppBar(
            title: "FruitMarket",
            centerTitle: true,
            addIcons: false,
            icon2: Icons.search,
          ),
          CustomDetailsSellerCart(h: h, w: w),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: h * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  fontSize: h * 0.02,
                  color: Colors.black,
                  title: "Category",
                ),
                CustomListCategory(h: h, items: items),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      fontSize: h * 0.021,
                      color: Colors.black,
                      title: "Products",
                    ),
                    Icon(Icons.format_line_spacing_outlined),
                  ],
                ),
                SizedBox(
                  height: h * 0.5,
                  child: ListView.builder(
                    itemCount: 3,
                    padding: EdgeInsets.only(top: 8),
                    itemBuilder: (context, count) {
                      return GestureDetector(
                        onTap: () {
                          context.go('/product');
                        },
                        child: CustomProductCart(h: h, w: w),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
