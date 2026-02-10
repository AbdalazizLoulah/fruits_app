import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:fruits_app/feature/order_tracking/view/widgets/custom_alert_cancel_order.dart';
import 'package:fruits_app/feature/order_tracking/view/widgets/custom_dote_way.dart';
import 'package:go_router/go_router.dart';

class OrderTrackingBody extends StatelessWidget {
  const OrderTrackingBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: h * 0.05),
          CustomAppBar(title: "OrderTracking", centerTitle: true,onTap: ()=>context.go('/nav'),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: h * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: h * 0.01),
                Center(
                  child: CustomText(
                    fontSize: h * 0.017,
                    color: ColorApp.gray,
                    title: "Your Order Code: #882610",
                    fontFamily: false,
                  ),
                ),
                Center(
                  child: CustomText(
                    fontSize: h * 0.017,
                    color: ColorApp.gray,
                    title: "3 items - 37.50 KD",
                    fontFamily: false,
                  ),
                ),
                Center(
                  child: CustomText(
                    fontSize: h * 0.017,
                    color: ColorApp.gray,
                    title: "Payment Method : Cash",
                    fontFamily: false,
                  ),
                ),
                SizedBox(height: h * 0.02),
                CustomDoteWay(
                  h: h,
                  w: w,
                  addWay: true,
                  isDone: false,
                  title: "Delivered",
                  des: "Estimated for 10 September, 2021 ",
                ),
                CustomDoteWay(
                  h: h,
                  w: w,
                  addWay: true,
                  isDone: false,
                  title: "Out for delivery",
                  des: "Estimated for 10 September, 2021  ",
                ),
      
                CustomDoteWay(
                  h: h,
                  w: w,
                  addWay: true,
                  isDone: true,
                  title: "Order shipped",
                  des: "Estimated for 10 September, 2021  ",
                ),
                CustomDoteWay(
                  h: h,
                  w: w,
                  addWay: true,
                  isDone: true,
                  title: "Confirmed",
                  des: "Your order has been confirmed ",
                ),
                CustomDoteWay(
                  h: h,
                  w: w,
                  addWay: false,
                  isDone: true,
                  title: "Order Placed",
                  des: "We have received your order ",
                ),
              ],
            ),
          ),
          CustomBottom(
            width: w * 0.8,
            title: "Confirm",
            heightBottom: h * 0.07,
            heightText: h * 0.02,
            colorBottom: ColorApp.green,
            colorText: Colors.white,
          ),
          SizedBox(height: h * 0.02),
          CustomBottom(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => CustomAlertCancelOrder(h: h, controller: controller, w: w),
              );
            },
            width: w * 0.8,
            title: "Cancel Order",
            heightBottom: h * 0.07,
            heightText: h * 0.02,
            colorBottom: Colors.redAccent,
            colorText: Colors.white,
          ),
        ],
      ),
    );
  }
}
