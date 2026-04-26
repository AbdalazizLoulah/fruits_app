import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:go_router/go_router.dart';

class CheckOutError extends StatelessWidget {
  const CheckOutError({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation =
        MediaQuery.of(context).orientation == Orientation.portrait;

    var h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            CustomAppBar(
              title: "checkout_title".tr(),
              centerTitle: true,
              backIcon: true,
              onTap: () {
              context.go('/chickOut');
              },
            ),
            SizedBox(height: h * 0.02),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: h * 0.06),
                    SvgPicture.asset("assets/image/error.svg"),
                    SizedBox(height: h * 0.03),
                    CustomText(
                      fontSize: orientation ? h * 0.03 : h * 0.05,
                      color: Colors.red,
                      title: "error_badge_title".tr(),
                    ),
                    SizedBox(height: h * 0.01),
                    CustomText(
                      fontSize: orientation ? h * 0.015 : h * 0.02,
                      color: ColorApp.gray,
                      title: "error_badge_message".tr(),
                    ),
                    SizedBox(height: h * 0.06),
                    CustomBottom(
                      onTap: () {
                        context.go('/chickOut');
                      },
                      width: h * 0.36,
                      title: "error_badge_button".tr(),
                      heightBottom: orientation ? h * 0.06 : h * 0.07,
                      heightText: orientation ? h * 0.02 : h * 0.03,
                      colorBottom: const Color.fromARGB(255, 250, 143, 136),
                      colorText: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
