import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/feature/details_seller/view/widgets/custom_product_cart.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            CustomAppBar(title: "Favorite", centerTitle: true),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, count) {
                  return CustomProductCart(
                    h: h,
                    w: w,
                    add: false,
                    addBottom: false,
                    icon: Icons.close,
                    title: "Store Name : Store 1",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
