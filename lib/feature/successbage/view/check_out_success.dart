import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:go_router/go_router.dart';

class CheckOutSuccess extends StatelessWidget {
  const CheckOutSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: h * 0.05),
          CustomAppBar(title: "checkout_title".tr(), centerTitle: true),

          Expanded(
            child: Container(
              child: Column(
                children: [
                  Image.asset("assets/image/success.png", height: h * 0.2),
                  SizedBox(height: h * 0.03),
                  CustomText(
                    fontSize: h * 0.025,
                    color: ColorApp.green,
                    title: "success_badge_title".tr(),
                  ),
                  SizedBox(height: h * 0.01),
                  CustomText(
                    fontSize: h * 0.015,
                    color: ColorApp.openGray,
                    title: "success_badge_message".tr(),
                  ),
                  SizedBox(height: h * 0.06),
                  CustomBottom(
                    onTap: () {
                      context.go('/chickOut');
                    },
                    width: h * 0.36,
                    title: "continue_shopping_button".tr(),
                    heightBottom: h * 0.06,
                    heightText: h * 0.02,
                    colorBottom: ColorApp.green,
                    colorText: Colors.white,
                  ),
                  SizedBox(height: h * 0.02),
                  CustomBottom(
                    onTap: () {
                      context.go('/chickOut');
                    },
                    width: h * 0.36,
                    title: "track_order_button".tr(),
                    heightBottom: h * 0.06,
                    heightText: h * 0.02,
                    colorBottom: Colors.white,
                    colorText: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
