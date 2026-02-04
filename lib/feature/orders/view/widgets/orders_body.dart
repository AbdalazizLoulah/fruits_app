import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/feature/orders/view/widgets/custom_card_orders.dart';

class OrdersBody extends StatelessWidget {
  const OrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          SizedBox(height: h * 0.055),
          CustomAppBar(centerTitle: true, title: "My Orders"),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsetsDirectional.only(top: h*0.02),
              itemCount: 4,
              itemBuilder: (context, count) {
                return CustomCardOrders(h: h, w: w);
              },
            ),
          ),
        ],
      ),
    );
  }
}
