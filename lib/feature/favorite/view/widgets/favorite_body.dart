import 'package:flutter/material.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/feature/details_seller/view/widgets/custom_product_cart.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            CustomAppBar(title: "Favorite", centerTitle: true),
            orientation == Orientation.portrait
                ? Expanded(
                    child: ListView.builder(
                      itemCount: 5,
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
