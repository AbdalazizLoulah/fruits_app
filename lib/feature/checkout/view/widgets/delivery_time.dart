// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/feature/checkout/view/widgets/custom_check_bottom.dart';

class DeliveryTime extends StatefulWidget {
  DeliveryTime({
    Key? key,
    required this.now,
    required this.date, required this.onChanged,
  }) : super(key: key);
  final bool? now;
  final bool? date;
  final Function(bool now, bool date) onChanged;
  @override
  State<DeliveryTime> createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  
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
            heightContainer: orientation ? h * 0.07 : h * 0.09,
            title: "Now",
            onTap: () {
              setState(() {
                widget.onChanged(true, false);
              });
            },
            isSelect: widget.now! ,
          ),
          SizedBox(height: h * 0.03),
          CustomCheckBottom(
            orientation: orientation,
            h: h,
            colorText: ColorApp.black,
            heightContainer: orientation ? h * 0.18 : h * 0.27,
            title: "Select Delivery Time",
            add: true,
            onTap: () {
              setState(() {
                widget.onChanged(false, true);
                // isSelectDate = !isSelectDate;
              });
            },
            isSelect: widget.date!,
          ),
        ],
      ),
    );
  }
}
