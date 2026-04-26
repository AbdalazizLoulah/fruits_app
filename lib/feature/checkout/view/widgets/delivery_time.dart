import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/feature/checkout/view/widgets/custom_check_bottom.dart';

class DeliveryTime extends StatefulWidget {
  const DeliveryTime({super.key});

  @override
  State<DeliveryTime> createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  bool isSelectNow = false;
  bool isSelectDate = false;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    final orientation =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: h * 0.02),
      child: Column(
        children: [
          SizedBox(height: h * 0.03),
          CustomCheckBottom(
            orientation: orientation,
            h: h,
            colorText: ColorApp.black,
            heightContainer:orientation? h * 0.07:h*0.09,
            title: "Now",
            onTap: () {
              setState(() {
                isSelectNow = true;
                isSelectDate = false;
                // isSelectNow = !isSelectNow;
              });
            },
            isSelect: isSelectNow,
          ),
          SizedBox(height: h * 0.03),
          CustomCheckBottom(
            orientation: orientation,
            h: h,
            colorText: ColorApp.black,
            heightContainer:orientation? h * 0.18 : h * 0.27,
            title: "Select Delivery Time",
            add: true,
            onTap: () {
              setState(() {
                isSelectNow = false;
                isSelectDate = true;
                // isSelectDate = !isSelectDate;
              });
            },
            isSelect: isSelectDate,
          ),
        ],
      ),
    );
  }
}
