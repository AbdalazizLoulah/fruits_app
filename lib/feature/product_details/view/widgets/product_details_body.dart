import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/feature/product_details/view/widgets/custom_details_product.dart';
import 'package:fruits_app/feature/product_details/view/widgets/custom_poster_product.dart';
import 'package:fruits_app/feature/product_details/view/widgets/custom_select_weight.dart';

class ProductDetailsBody extends StatefulWidget {
  const ProductDetailsBody({super.key});

  @override
  State<ProductDetailsBody> createState() => _ProductDetailsBodyState();
}

class _ProductDetailsBodyState extends State<ProductDetailsBody> {
  bool showWeight = false;
  bool showAddons = false;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              CustomAppBar(
                title: "Product Name",
                centerTitle: true,
                addIcons: false,
                icon1: Icons.favorite_border,
                icon2: Icons.ios_share,
              ),
              SizedBox(height: h * 0.01),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: h * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomPosterProduct(h: h),
                    SizedBox(height: h * 0.014),
                    CustomDetailsProduct(h: h),
                    SizedBox(height: h * 0.014),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit , sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    ),
                    SizedBox(height: h * 0.014),
                    Text("Sell Per : Kartoon"),
                    SizedBox(height: h * 0.016),
                    CustomSelectWeight(
                      itemCount: 3,
                      show: showWeight,
                      h: h,
                      title: "Select weight",
                      icon: Icons.keyboard_arrow_up,
                      onTap: () {
                        setState(() {
                          showWeight = !showWeight;
                        });
                      },
                    ),
                    CustomSelectWeight(
                      itemCount: 2,
                      onTap: () {
                        setState(() {
                          showAddons = !showAddons;
                        });
                      },
                      show: showAddons,
                      h: h,
                      title: "Select Addons",
                      icon: Icons.keyboard_arrow_down,
                    ),
                    SizedBox(height: h * 0.016),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomBottom(
                          width: h * 0.15,
                          title: "Add to Cart",
                          heightBottom: h * 0.04,
                          heightText: h * 0.015,
                          colorBottom: ColorApp.green,
                          colorText: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(height: h * 0.05),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
