import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:fruits_app/feature/checkout/view/widgets/custom_dote_check_out.dart';

class CustomSteeperOrder extends StatelessWidget {
  const CustomSteeperOrder({
    super.key,
    required this.h,
    this.done = true,
    required this.currentStep,
  });
  final int currentStep;
  final double h;
  final bool done;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(left: h*0.06),
          child: SizedBox(
            height: h*0.05,
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, count) {
                return CustomDoteCheckOut(
                  count: count,
                  h: h,
                  addWay: true,
                  currentStep: currentStep,
                );
              },
            ),
          ),
        ),
        SizedBox(height: h * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomText(
              fontSize: h * 0.017,
              color: currentStep == 0 ? Colors.green : Colors.grey,
              title: "Delivery Time",
              fontFamily: false,
            ),
            CustomText(
              fontSize: h * 0.017,
              color: currentStep == 1 ? Colors.green : Colors.grey,
              title: "Delivery Address",
              fontFamily: false,
            ),
            CustomText(
              fontSize: h * 0.017,
              color: currentStep == 2 ? Colors.green : Colors.grey,
              title: "Payment",
              fontFamily: false,
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}
