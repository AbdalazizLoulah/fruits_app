import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/feature/checkout/view/widgets/custom_steeper_order.dart';
import 'package:fruits_app/feature/checkout/view/widgets/delivery_address.dart';
import 'package:fruits_app/feature/checkout/view/widgets/delivery_time.dart';
import 'package:fruits_app/feature/checkout/view/widgets/payment.dart';
import 'package:go_router/go_router.dart';

class CheckOutBody extends StatefulWidget {
  const CheckOutBody({super.key});

  @override
  State<CheckOutBody> createState() => _CheckOutBodyState();
}

class _CheckOutBodyState extends State<CheckOutBody> {
  final PageController control = PageController();
  int currentStep = 0;
  void nextStep() {
    if (currentStep < 2) {
      control.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() => currentStep++);
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(height: h * 0.05),
        CustomAppBar(title: "Check Out", centerTitle: true,onTap: ()=>context.go('/nav'),),
        SizedBox(height: h * 0.02),
        CustomSteeperOrder(h: h, currentStep: currentStep),
        Expanded(
          child: PageView(
            controller: control,
            physics: const NeverScrollableScrollPhysics(),
            children: [DeliveryTime(), DeliveryAddress(), Payment()],
          ),
        ),
        CustomBottom(
          onTap: () {
            if (currentStep == 2) {
              context.go('/chickOutError');
            }
            nextStep();
          },
          width: h * 0.36,
          title: currentStep == 2 ? "Place Order" : "Continue",
          heightBottom: h * 0.06,
          heightText: h * 0.02,
          colorBottom: ColorApp.green,
          colorText: Colors.white,
        ),
        SizedBox(height: h * 0.03),
      ],
    );
  }
}


