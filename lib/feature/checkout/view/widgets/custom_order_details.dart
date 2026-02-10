import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_text.dart';

class CustomOrderDetails extends StatelessWidget {
  const CustomOrderDetails({
    super.key,
    required this.h,
  });

  final double h;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          SizedBox(height: h * 0.02),
          CustomText(
            fontSize: h * 0.02,
            color: ColorApp.black,
            title: "Order Details",
          ),
          SizedBox(height: h * 0.01),
          Row(
            children: [
              Expanded(
                child: CustomText(
                  fontSize: h * 0.015,
                  color: ColorApp.gray,
                  title: "Total Items",
                  fontFamily: false,
                ),
              ),
              CustomText(
                fontSize: h * 0.015,
                color: ColorApp.green,
                title: "4 Items in cart",
              ),
            ],
          ),
          SizedBox(height: h * 0.01),
    
          Row(
            children: [
              Expanded(
                child: CustomText(
                  fontSize: h * 0.015,
                  color: ColorApp.gray,
                  title: "Subtotal",
                  fontFamily: false,
                ),
              ),
              CustomText(
                fontSize: h * 0.015,
                color: ColorApp.green,
                title: "36.00 KD",
              ),
            ],
          ),
          SizedBox(height: h * 0.01),
          Row(
            children: [
              Expanded(
                child: CustomText(
                  fontSize: h * 0.015,
                  color: ColorApp.gray,
                  title: "Shipping Charges",
                  fontFamily: false,
                ),
              ),
              CustomText(
                fontSize: h * 0.015,
                color: ColorApp.green,
                title: "1.50 KD",
              ),
            ],
          ),
          Divider(),
          SizedBox(height: h * 0.01),
          Row(
            children: [
              Expanded(
                child: CustomText(
                  fontSize: h * 0.015,
                  color: ColorApp.green,
                  title: "Bag Total",
                ),
              ),
              CustomText(
                fontSize: h * 0.015,
                color: ColorApp.green,
                title: "37.50 KD",
              ),
            ],
          ),
        ],);
  }
}