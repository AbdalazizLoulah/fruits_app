
import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/feature/orders/view/widgets/custom_card_orders.dart';
import 'package:go_router/go_router.dart';

class OrdersBody extends StatelessWidget {
  const OrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final orientation =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      child: Column(
        children: [
          CustomAppBar(
            centerTitle: true, title: "My Orders",onTap: () {
            
          },),
          orientation
              ? Expanded(
                  child: ListView.builder(
                    padding: EdgeInsetsDirectional.only(top: h * 0.02),
                    itemCount: 4,
                    itemBuilder: (context, count) {
                      return GestureDetector(
                        onTap: () {
                          context.push('/orderTracking');
                        },
                        child: CustomCardOrders(h: h, w: w),
                      );
                    },
                  ),
                )
              : Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                      childAspectRatio: 6,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                          context.push('/orderTracking');
                        },
                        child: CustomCardOrders(h: h, w: w,orientation: true,));
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
