import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:fruits_app/feature/basket/view/widgets/basket_body.dart';
import 'package:fruits_app/feature/checkout/view/widgets/custom_check_bottom.dart';
import 'package:fruits_app/feature/checkout/view/widgets/custom_order_details.dart';

class Payment extends StatefulWidget {
  const Payment({
    super.key,
    required this.data,
    this.credit,
    this.cash,
    this.knet,
    required this.onChanged,
  });
  final CheckOut data;
  final bool? credit;
  final bool? cash;
  final bool? knet;
  final Function(bool cre, bool ca, bool kn) onChanged;

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    final orientation =
        MediaQuery.of(context).orientation == Orientation.portrait;

    var h = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: h * 0.02),
      child: SingleChildScrollView(
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
              orientation: orientation,
              heightContainer: orientation ? h * 0.07 : h * 0.09,
              colorText: ColorApp.gray,
              h: h,
              addIcon: true,
              title: "Do You Have any Coupon Code?",
            ),
            CustomOrderDetails(h: h, data: widget.data),
            SizedBox(height: orientation ? h * 0.02 : h * 0.03),
            CustomText(
              fontSize: orientation ? h * 0.02 : h * 0.03,
              color: ColorApp.black,
              title: "Payment",
            ),
            SizedBox(height: orientation ? h * 0.01 : h * 0.02),
            CustomCheckBottom(
              orientation: orientation,
              onTap: () {
                widget.onChanged(true, false, false);
              },
              isSelect: widget.credit!,
              addImage: true,
              image: "assets/image/credit_card.svg",
              heightContainer: orientation ? h * 0.07 : h * 0.09,
              colorText: Colors.black,
              h: h,
              title: "  Credit Card/Debit card",
            ),
            SizedBox(height: h * 0.02),
            CustomCheckBottom(
              orientation: orientation,
              onTap: () {
                widget.onChanged(false, true, false);
              },
              isSelect: widget.cash!,
              addImage: true,
              image: "assets/image/cash.svg",
              heightContainer: orientation ? h * 0.07 : h * 0.09,
              colorText: Colors.black,
              h: h,
              title: "  Cash of Delivery",
            ),
            SizedBox(height: h * 0.02),
            CustomCheckBottom(
              orientation: orientation,
              onTap: () {
                widget.onChanged(false, false, true);
              },
              isSelect: widget.knet!,
              addImage: true,
              image: "assets/image/knet.svg",
              heightContainer: orientation ? h * 0.07 : h * 0.09,
              colorText: Colors.black,
              h: h,
              title: " Knet",
            ),
          ],
        ),
      ),
    );
  }
}
