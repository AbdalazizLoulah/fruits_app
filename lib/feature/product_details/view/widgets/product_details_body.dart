import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/feature/product_details/view/widgets/custom_details_product.dart';
import 'package:fruits_app/feature/product_details/view/widgets/custom_poster_product.dart';
import 'package:fruits_app/feature/product_details/view/widgets/custom_select_weight.dart';
import 'package:go_router/go_router.dart';

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
    final orientation =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              CustomAppBar(
                onTap: () {
                  context.go('/nav');
                },
                title: "productName".tr(),
                centerTitle: true,
                addIcons: false,
                icon1: Icons.favorite_border,
                icon2: Icons.ios_share,
                backIcon: true,
              ),
              SizedBox(height: h * 0.01),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: h * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomPosterProduct(h: h),
                    SizedBox(height: h * 0.014),
                    CustomDetailsProduct(h: h,orientation: orientation,),
                    SizedBox(height: h * 0.014),
                    Text(
                      "productDescription".tr()),
                    SizedBox(height: h * 0.014),
                    Text("sellPer".tr()),
                    SizedBox(height: h * 0.016),
                    CustomSelectWeight(
                      orientation: orientation,
                      itemCount: 3,
                      show: showWeight,
                      h: h,
                      title: "selectWeight".tr(),
                      icon: Icons.keyboard_arrow_up,
                      onTap: () {
                        setState(() {
                          showWeight = !showWeight;
                        });
                      },
                    ),
                    CustomSelectWeight(
                      orientation: orientation,
                      itemCount: 2,
                      onTap: () {
                        setState(() {
                          showAddons = !showAddons;
                        });
                      },
                      show: showAddons,
                      h: h,
                      title: "selectAddons".tr(),
                      icon: Icons.keyboard_arrow_down,
                    ),
                    SizedBox(height: h * 0.016),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomBottom(
                          width:orientation? h * 0.15:h*0.3,
                          title: "addToCart".tr(),
                          heightBottom:orientation? h * 0.04:h*0.07,
                          heightText:orientation? h * 0.015:h*0.025,
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
