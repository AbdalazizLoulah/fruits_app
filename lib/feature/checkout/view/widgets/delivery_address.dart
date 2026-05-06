import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:fruits_app/feature/checkout/view/widgets/custom_card_address.dart';
import 'package:fruits_app/feature/checkout/view/widgets/custom_check_bottom.dart';

class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({
    super.key,
    required this.address,
    required this.onChanged,
  });
  final bool address;
  final Function(bool now) onChanged;
  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {

  @override
  Widget build(BuildContext context) {
    final orientation =
        MediaQuery.of(context).orientation == Orientation.portrait;
    var h = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: h * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            fontSize: h * 0.02,
            color: ColorApp.black,
            title: "Select Delivery Address",
          ),
          SizedBox(height: h * 0.01),
          CustomCheckBottom(
            orientation: orientation,
            heightContainer: h * 0.08,
            colorText: ColorApp.black,
            h: h,
            addIcon: true,
            icon: Icons.add,
            title: "Add New Address",
          ),
          SizedBox(height: h * 0.02),
          CustomCardAddress(
            h: h,
            isSelect: widget.address,
            onTap: () {
              widget.onChanged(!widget.address );
            },
          ),
        ],
      ),
    );
  }
}
