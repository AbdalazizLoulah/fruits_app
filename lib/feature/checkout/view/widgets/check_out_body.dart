import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/feature/basket/view/widgets/basket_body.dart';
import 'package:fruits_app/feature/checkout/view/widgets/custom_steeper_order.dart';
import 'package:fruits_app/feature/checkout/view/widgets/delivery_address.dart';
import 'package:fruits_app/feature/checkout/view/widgets/delivery_time.dart';
import 'package:fruits_app/feature/checkout/view/widgets/payment.dart';
import 'package:go_router/go_router.dart';

class CheckOutBody extends StatefulWidget {
  const CheckOutBody({super.key, required this.data});
  final CheckOut data;

  @override
  State<CheckOutBody> createState() => _CheckOutBodyState();
}

class _CheckOutBodyState extends State<CheckOutBody> {
  final PageController control = PageController();
  int currentStep = 0;
  bool isSelectNow = false;
  bool isSelectDate = false;
  bool address = false;
  bool credit = false;
  bool cash = false;
  bool knet = false;
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
    final orientation =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Column(
      children: [
        CustomAppBar(
          title: "Check Out",
          centerTitle: true,
          onTap: () => context.go('/nav', extra: 2),
          backIcon: true,
        ),
        SizedBox(height: h * 0.02),
        CustomSteeperOrder(
          h: h,
          currentStep: currentStep,
          orientation: orientation,
        ),
        Expanded(
          child: PageView(
            controller: control,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              DeliveryTime(
                now: isSelectNow,
                date: isSelectDate,
                onChanged: (now, date) {
                  setState(() {
                    isSelectNow = now;
                    isSelectDate = date;
                  });
                },
              ),
              DeliveryAddress(
                address: address,
                onChanged: (select) {
                  setState(() {
                    address = select;
                  });
                },
              ),
              Payment(
                data: widget.data,
                credit: credit,
                cash: cash,
                knet: knet,
                onChanged: (cre, ca, kn) {
                  setState(() {
                    credit = cre;
                    cash = ca;
                    knet = kn;
                  });
                },
              ),
            ],
          ),
        ),
        CustomBottom(
          onTap: () {
            if (currentStep == 0) {
              if (isSelectNow != isSelectDate) {
                nextStep();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("اختار نوع توصيل واحد بس")),
                );
              }
              return;
            }

            if (currentStep == 1) {
              if (address == true) {
                nextStep();
              } else {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("اختار العنوان")));
              }
              return;
            }
            if (currentStep == 2) {
              int count = (cash ? 1 : 0) + (credit ? 1 : 0) + (knet ? 1 : 0);
              if (count != 1) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("اختار طريقة دفع واحدة بس")),
                );
                return;
              }
              context.go('/chickOutError');
              return;
            }
          },
          width: h * 0.36,
          title: currentStep == 2 ? "Place Order" : "Continue",
          heightBottom: orientation ? h * 0.06 : h * 0.09,
          heightText: orientation ? h * 0.015 : h * 0.04,
          colorBottom: ColorApp.green,
          colorText: Colors.white,
        ),
        SizedBox(height: h * 0.03),
      ],
    );
  }
}
