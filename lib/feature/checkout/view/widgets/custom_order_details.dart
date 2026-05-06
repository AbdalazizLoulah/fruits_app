import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:fruits_app/feature/basket/view/widgets/basket_body.dart';

class CustomOrderDetails extends StatelessWidget {
  const CustomOrderDetails({
    super.key,
    required this.h, required this.data,
  });
  final CheckOut data;
  final double h;

  @override
  Widget build(BuildContext context) {
    final orientation =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          SizedBox(height: h * 0.02),
          CustomText(
            fontSize:orientation? h * 0.02:h*0.03,
            color: ColorApp.black,
            title: "Order Details",
          ),
          SizedBox(height: h * 0.01),
          Row(
            children: [
              Expanded(
                child: CustomText(
                  fontSize:orientation? h * 0.015:h*0.025,
                  color: ColorApp.gray,
                  title: "Total Items",
                  fontFamily: false,
                ),
              ),
              CustomText(
                fontSize: orientation ? h * 0.015 : h * 0.025,
                color: ColorApp.green,
                title: "${data.item} Items in cart",
              ),
            ],
          ),
          SizedBox(height: h * 0.01),
    
          Row(
            children: [
              Expanded(
                child: CustomText(
                  fontSize: orientation ? h * 0.015 : h * 0.025,
                  color: ColorApp.gray,
                  title: "Subtotal",
                  fontFamily: false,
                ),
              ),
              CustomText(
                fontSize: orientation ? h * 0.015 : h * 0.025,
                color: ColorApp.green,
                title: "${data.total} KD",
              ),
            ],
          ),
          SizedBox(height: h * 0.01),
          Row(
            children: [
              Expanded(
                child: CustomText(
                  fontSize: orientation ? h * 0.015 : h * 0.025,
                  color: ColorApp.gray,
                  title: "Shipping Charges",
                  fontFamily: false,
                ),
              ),
              CustomText(
                fontSize: orientation ? h * 0.015 : h * 0.025,
                color: ColorApp.green,
                title: "${data.shipping} KD",
              ),
            ],
          ),
          Divider(),
          SizedBox(height: h * 0.01),
          Row(
            children: [
              Expanded(
                child: CustomText(
                  fontSize: orientation ? h * 0.015 : h * 0.025,
                  color: ColorApp.green,
                  title: "Bag Total",
                ),
              ),
              CustomText(
                fontSize: orientation ? h * 0.015 : h * 0.025,
                color: ColorApp.green,
                title: "${data.finalTotal} KD",
              ),
            ],
          ),
        ],);
  }
}