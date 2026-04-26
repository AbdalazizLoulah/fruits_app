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
    final orientation =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      child: Column(
        children: [
          CustomAppBar(
            onTap: () {
              context.go('/nav');
            },
            title: "FruitMarket",
            centerTitle: true,
            addIcons: false,
            icon2: Icons.search,
            backIcon: true,
          ),
          CustomDetailsSellerCart(h: h, w: w, orientation: orientation),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: h * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  fontSize: orientation ? h * 0.02 : h * 0.03,
                  color: Colors.black,
                  title: "Category",
                ),
                CustomListCategory(
                  h: h,
                  items: items,
                  orientation: orientation,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      fontSize: orientation ? h * 0.02 : h * 0.03,
                      color: Colors.black,
                      title: "Products",
                    ),
                    Icon(Icons.format_line_spacing_outlined),
                  ],
                ),
                SizedBox(
                  height: orientation ? h * 0.5 : h * 0.25,
                  child: orientation
                      ? ListView.builder(
                          itemCount: 3,
                          padding: EdgeInsets.only(top: 8),
                          itemBuilder: (context, count) {
                            return GestureDetector(
                              onTap: () {
                                context.go('/product');
                              },
                              child: CustomProductCart(h: h, w: w, title: ""),
                            );
                          },
                        )
                      : Padding(
                          padding: EdgeInsets.only(top: h * 0.02),
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 2,
                                  crossAxisSpacing: 2,
                                  childAspectRatio: 6,
                                ),
                            itemCount: 4,
                            itemBuilder: (context, count) => GestureDetector(
                              onTap: () {
                                context.go('/product');
                              },
                              child: CustomProductCart(h: h, w: w, title: ""),
                            ),
                          ),
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
