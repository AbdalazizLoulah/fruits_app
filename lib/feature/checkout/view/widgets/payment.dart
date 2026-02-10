import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:fruits_app/feature/checkout/view/widgets/custom_check_bottom.dart';
import 'package:fruits_app/feature/checkout/view/widgets/custom_order_details.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
    bool credit = false;
  bool cash = false;
  bool kent = false;
  @override
  Widget build(BuildContext context) {
  
    var h = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: h * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            fontSize: h * 0.02,
            color: ColorApp.black,
            title: "Coupon Code",
          ),
          SizedBox(height: h * 0.01),
          CustomCheckBottom(
            heightContainer: h * 0.07,
            colorText: ColorApp.gray,
            h: h,
            addIcon: true,
            title: "Do You Have any Coupon Code?",
          ),
          CustomOrderDetails(h: h),
          SizedBox(height: h * 0.02),
          CustomText(
            fontSize: h * 0.02,
            color: ColorApp.black,
            title: "Payment",
          ),
          CustomCheckBottom(
            onTap: () {
              setState(() {
                credit = true;
                cash = false;
                kent = false;
              });
            },
            isSelect: credit,
            addImage: true,
            image: "assets/image/credit_card.svg",
            heightContainer: h * 0.07,
            colorText: Colors.black,
            h: h,
            title: "  Credit Card/Debit card",
          ),
          SizedBox(height: h * 0.02),
          CustomCheckBottom(
            onTap: (){
              setState(() {
                  credit = false;
                cash = true;
                kent = false;
              });
            },
            isSelect: cash,
            addImage: true,
            image: "assets/image/cash.svg",
            heightContainer: h * 0.07,
            colorText: Colors.black,
            h: h,
            title: "  Cash of Delivery",
          ),
          SizedBox(height: h * 0.02),
          CustomCheckBottom(
            onTap: () {
              setState(() {
                credit = false;
                cash = false;
                kent = true;
              });
            },
            isSelect: kent,
            addImage: true,
            image: "assets/image/knet.svg",
            heightContainer: h * 0.072,
            colorText: Colors.black,
            h: h,
            title: " Knet",
          ),
        ],
      ),
    );
  }
}
