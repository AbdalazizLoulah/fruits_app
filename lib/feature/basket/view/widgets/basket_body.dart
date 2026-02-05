import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:fruits_app/feature/basket/view/widgets/custom_total.dart';
import 'package:fruits_app/feature/details_seller/view/widgets/custom_product_cart.dart';

class BasketBody extends StatelessWidget {
  const BasketBody({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          CustomAppBar(title: "Basket", centerTitle: true),
          SizedBox(
            height: h * 0.52,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, count) {
                return CustomProductCart(h: h, w: w, add: false,icon: Icons.delete_forever_rounded,title: "",);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: h * 0.02),
            child: Column(
              children: [
                Text(
                  "--------------------------------------------",
                  style: TextStyle(fontSize: h * 0.033, color: ColorApp.green),
                ),
                CustomTotal(
                  h: h,
                  title: "Subtotal",
                  price: "36.00 ",
                  colorTitle: ColorApp.gray,
                ),
                SizedBox(height: h * 0.01),
                CustomTotal(
                  h: h,
                  title: "Shipping Charges",
                  price: "1.50 ",
                  colorTitle: ColorApp.gray,
                ),
                SizedBox(height: h * 0.01),
                CustomTotal(
                  h: h,
                  title: "Bag Total",
                  price: "37.50 ",
                  colorTitle: ColorApp.green,
                ),
                SizedBox(height: h * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          fontSize: h * 0.015,
                          color: ColorApp.gray,
                          title: "4 items in cart",
                        ),
                        CustomText(
                          fontSize: h * 0.013,
                          color: ColorApp.green,
                          title: "37.50 KD",
                        ),
                      ],
                    ),
                    CustomBottom(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Container(child: Center(child: Text("zezo"),),)));
                      },
                      width: h * 0.2,
                      title: "Procced To Checkout",
                      heightBottom: h * 0.04,
                      heightText: h * 0.015,
                      colorBottom: ColorApp.green,
                      colorText: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
