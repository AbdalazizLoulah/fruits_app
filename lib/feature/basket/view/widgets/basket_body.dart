import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:fruits_app/feature/basket/view/widgets/custom_total.dart';
import 'package:fruits_app/feature/details_seller/data/models/product_model.dart';
import 'package:fruits_app/feature/details_seller/view/widgets/custom_product_cart.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BasketBody extends StatefulWidget {
  const BasketBody({super.key});

  @override
  State<BasketBody> createState() => _BasketBodyState();
}

class _BasketBodyState extends State<BasketBody> {
  var box = Hive.box<ProductModel>('products');
  List<ProductModel> products = [];

  @override
  void initState() {
    // TODO: implement initState
    products = box.values.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomAppBar(title: "Basket", centerTitle: true),

          /// BODY
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: box.listenable(),
              builder: (context, Box<ProductModel> box, _) {
                var products = box.values.toList();

                double total = products.fold(
                  0,
                  (sum, item) => sum + item.priceAfterDiscount,
                );

                if (products.isEmpty) {
                
                  return Center(child: Text("The Basket is Empty"));
                }
                return isPortrait
                    ? buildPortrait(h, w, products, total)
                    : buildLandscape(h, w, products, total);
              },
            ),
          ),
        ],
      ),
    );
  }

  // ================= Portrait =================

  Widget buildPortrait(
    double h,
    double w,
    List<ProductModel> products,
    double total,
  ) {
    double total = products.fold(
      0,
      (sum, item) => sum + item.priceAfterDiscount,
    );

    return Column(
      children: [
        /// Products
        Expanded(
          flex: 6,
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return CustomProductCart(
                removeCart: () {
                  setState(() {
                    box.delete(products[index].key);
                    products = box.values.toList();
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(" removed from cart"),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                data: products[index],
                h: h,
                w: w,
                add: false,
                icon: Icons.delete_forever_rounded,
                title: "",
              );
            },
          ),
        ),

        DottedLine(dashColor: ColorApp.openGray),

        /// Totals
        Expanded(flex: 4, child: buildTotalsSection(h, total)),
      ],
    );
  }

  // ================= Landscape =================

  Widget buildLandscape(
    double h,
    double w,
    List<ProductModel> products,
    double total,
  ) {
    double total = products.fold(
      0,
      (sum, item) => sum + item.priceAfterDiscount,
    );
    return Row(
      children: [
        /// Products
        Expanded(
          flex: 6,
          child: products.isEmpty
              ? Text("The Basket is Empty")
              : ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return CustomProductCart(
                      removeCart: () {
                        setState(() {
                          box.delete(products[index].key);
                          products = box.values.toList();
                        });
                      },
                      h: h,
                      w: w,
                      add: false,
                      icon: Icons.delete_forever_rounded,
                      title: "",
                    );
                  },
                ),
        ),

        DottedLine(dashColor: ColorApp.openGray, direction: Axis.vertical),

        /// Totals
        Expanded(flex: 4, child: buildTotalsSection(h, total)),
      ],
    );
  }

  // ================= Totals Widget =================

  Widget buildTotalsSection(double h, double total) {
    double shipping = 1.5;
    double finalTotal = total + shipping;
    final orientation =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: h * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTotal(
            h: h,
            title: "Subtotal",
            price: products.isEmpty ? "00.00" : "${total} ",
            colorTitle: ColorApp.gray,
          ),
          SizedBox(height: h * 0.01),
          CustomTotal(
            h: h,
            title: "Shipping Charges",
            price: products.isEmpty ? "00.00" : "${shipping} ",
            colorTitle: ColorApp.gray,
          ),
          SizedBox(height: h * 0.01),

          CustomTotal(
            h: h,
            title: "Bag Total",
            price: products.isEmpty ? "00.00" : "${finalTotal} ",
            colorTitle: ColorApp.green,
          ),
          SizedBox(height: h * 0.03),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    fontSize: orientation ? h * 0.015 : h * 0.025,
                    color: ColorApp.gray,
                    title: products.isEmpty
                        ? "0 items in cart"
                        : "${products.length} items in cart",
                  ),
                  CustomText(
                    fontSize: orientation ? h * 0.014 : h * 0.025,
                    color: ColorApp.green,
                    title: products.isEmpty ? "00.00" : "37.50 KD",
                  ),
                ],
              ),

              CustomBottom(
                onTap: () {
                  context.go('/chickOut');
                },
                width: orientation ? h * 0.22 : h * 0.35,
                title: "Proceed To Checkout",
                heightBottom: orientation ? h * 0.045 : h * 0.07,
                heightText: orientation ? h * 0.015 : h * 0.025,
                colorBottom: ColorApp.green,
                colorText: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
