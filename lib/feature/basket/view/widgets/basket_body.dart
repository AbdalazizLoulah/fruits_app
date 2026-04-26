// import 'package:dotted_line/dotted_line.dart';
// import 'package:flutter/material.dart';
// import 'package:fruits_app/core/const/color_app.dart';
// import 'package:fruits_app/core/widget/custom_app_bar.dart';
// import 'package:fruits_app/core/widget/custom_bottom.dart';
// import 'package:fruits_app/core/widget/custom_text.dart';
// import 'package:fruits_app/feature/basket/view/widgets/custom_total.dart';
// import 'package:fruits_app/feature/details_seller/view/widgets/custom_product_cart.dart';
// import 'package:go_router/go_router.dart';

// class BasketBody extends StatefulWidget {
//   const BasketBody({super.key});
//   @override
//   State<BasketBody> createState() => _BasketBodyState();
// }

// class _BasketBodyState extends State<BasketBody> {
//   @override
//   Widget build(BuildContext context) {
//     var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;
//     final orientation =
//         MediaQuery.of(context).orientation == Orientation.portrait;
//     return Container(
//       child: Column(
//         children: [
//           CustomAppBar(title: "Basket", centerTitle: true),
//           orientation
//               ? Column(
//                   children: [
//                     SizedBox(
//                       height: h * 0.52,
//                       child: ListView.builder(
//                         itemCount: 3,
//                         itemBuilder: (context, count) {
//                           return CustomProductCart(
//                             h: h,
//                             w: w,
//                             add: false,
//                             icon: Icons.delete_forever_rounded,
//                             title: "",
//                           );
//                         },
//                       ),
//                     ),
//                     DottedLine(dashColor: ColorApp.openGray, dashGapLength: 5),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: h * 0.02),
//                       child: Column(
//                         children: [
//                           SizedBox(height: h * 0.01),
//                           CustomTotal(
//                             h: h,
//                             title: "Subtotal",
//                             price: "36.00 ",
//                             colorTitle: ColorApp.gray,
//                           ),
//                           SizedBox(height: h * 0.01),
//                           CustomTotal(
//                             h: h,
//                             title: "Shipping Charges",
//                             price: "1.50 ",
//                             colorTitle: ColorApp.gray,
//                           ),
//                           SizedBox(height: h * 0.01),
//                           CustomTotal(
//                             h: h,
//                             title: "Bag Total",
//                             price: "37.50 ",
//                             colorTitle: ColorApp.green,
//                           ),
//                           SizedBox(height: h * 0.04),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   CustomText(
//                                     fontSize: h * 0.015,
//                                     color: ColorApp.gray,
//                                     title: "4 items in cart",
//                                   ),
//                                   CustomText(
//                                     fontSize: h * 0.013,
//                                     color: ColorApp.green,
//                                     title: "37.50 KD",
//                                   ),
//                                 ],
//                               ),
//                               CustomBottom(
//                                 onTap: () {
//                                   context.go('/chickOut');
//                                 },
//                                 width: h * 0.2,
//                                 title: "Procced To Checkout",
//                                 heightBottom: h * 0.04,
//                                 heightText: h * 0.015,
//                                 colorBottom: ColorApp.green,
//                                 colorText: Colors.white,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 )
//               : Row(
//                   children: [
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: 3,
//                         itemBuilder: (context, count) {
//                           return CustomProductCart(
//                             h: h,
//                             w: w,
//                             add: false,
//                             icon: Icons.delete_forever_rounded,
//                             title: "",
//                           );
//                         },
//                       ),
//                     ),
//                     DottedLine(dashColor: ColorApp.openGray, dashGapLength: 5,direction: Axis.vertical,),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: h * 0.02),
//                       child: Column(
//                         children: [
//                           SizedBox(height: h * 0.01),
//                           CustomTotal(
//                             h: h,
//                             title: "Subtotal",
//                             price: "36.00 ",
//                             colorTitle: ColorApp.gray,
//                           ),
//                           SizedBox(height: h * 0.01),
//                           CustomTotal(
//                             h: h,
//                             title: "Shipping Charges",
//                             price: "1.50 ",
//                             colorTitle: ColorApp.gray,
//                           ),
//                           SizedBox(height: h * 0.01),
//                           CustomTotal(
//                             h: h,
//                             title: "Bag Total",
//                             price: "37.50 ",
//                             colorTitle: ColorApp.green,
//                           ),
//                           SizedBox(height: h * 0.04),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   CustomText(
//                                     fontSize: h * 0.015,
//                                     color: ColorApp.gray,
//                                     title: "4 items in cart",
//                                   ),
//                                   CustomText(
//                                     fontSize: h * 0.013,
//                                     color: ColorApp.green,
//                                     title: "37.50 KD",
//                                   ),
//                                 ],
//                               ),
//                               CustomBottom(
//                                 onTap: () {
//                                   context.go('/chickOut');
//                                 },
//                                 width: h * 0.2,
//                                 title: "Procced To Checkout",
//                                 heightBottom: h * 0.04,
//                                 heightText: h * 0.015,
//                                 colorBottom: ColorApp.green,
//                                 colorText: Colors.white,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//         ],
//       ),
//     );
//   }
// }
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:fruits_app/feature/basket/view/widgets/custom_total.dart';
import 'package:fruits_app/feature/details_seller/view/widgets/custom_product_cart.dart';
import 'package:go_router/go_router.dart';

class BasketBody extends StatefulWidget {
  const BasketBody({super.key});

  @override
  State<BasketBody> createState() => _BasketBodyState();
}

class _BasketBodyState extends State<BasketBody> {
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
            child: isPortrait ? buildPortrait(h, w) : buildLandscape(h, w),
          ),
        ],
      ),
    );
  }

  // ================= Portrait =================

  Widget buildPortrait(double h, double w) {
    return Column(
      children: [
        /// Products
        Expanded(
          flex: 6,
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return CustomProductCart(
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
        Expanded(flex: 4, child: buildTotalsSection(h)),
      ],
    );
  }

  // ================= Landscape =================

  Widget buildLandscape(double h, double w) {
    return Row(
      children: [
        /// Products
        Expanded(
          flex: 6,
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return CustomProductCart(
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
        Expanded(flex: 4, child: buildTotalsSection(h)),
      ],
    );
  }

  // ================= Totals Widget =================

  Widget buildTotalsSection(double h) {
    final orientation = MediaQuery.of(context).orientation == Orientation.portrait;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: h * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          SizedBox(height: h * 0.03),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    fontSize:orientation? h * 0.015:h*0.025,
                    color: ColorApp.gray,
                    title: "4 items in cart",
                  ),
                  CustomText(
                    fontSize: orientation ? h * 0.014 : h * 0.025,
                    color: ColorApp.green,
                    title: "37.50 KD",
                  ),
                ],
              ),

              CustomBottom(
                onTap: () {
                  context.go('/chickOut');
                },
                width:orientation? h * 0.22:h*0.35,
                title: "Proceed To Checkout",
                heightBottom:orientation? h * 0.045:h*0.07,
                heightText:orientation? h * 0.015:h*0.025,
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
