import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:fruits_app/feature/details_seller/data/models/product_model.dart';

class CustomDetailsProduct extends StatelessWidget {
  const CustomDetailsProduct({
    super.key,
    required this.h,
    this.orientation = false, required this.data,
  });

  final double h;
  final bool orientation;
  final ProductModel data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              fontSize: orientation ? h * 0.018 : h * 0.025,
              color: ColorApp.green,
              title: "${data.categoryNameEn}",
            ),
            CustomText(
              fontSize: orientation ? h * 0.024 : h * 0.03,
              color: Colors.black,
              title: "${data.nameEn}",
            ),
          ],
        ),
        Column(
          children: [
            CustomText(
              fontSize: orientation ? h * 0.018 : h * 0.025,
              color: ColorApp.gray,
              title: "Price",
              fontFamily: false,
            ),
            Row(
              children: [
                CustomText(
                  fontSize: orientation ? h * 0.024 : h * 0.03,
                  color: ColorApp.gray,
                  title: "KD${data.price}.00 ",
                ),
                CustomText(
                  fontSize: orientation ? h * 0.015 : h * 0.02,
                  color: Colors.redAccent,
                  title: " KD${data.priceAfterDiscount}.00",
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
