import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/core/widget/custom_circle.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:fruits_app/feature/more/view/widget/custom_category_profile.dart';
import 'package:fruits_app/feature/more/view/widget/custom_dialog_language.dart';
import 'package:go_router/go_router.dart';

class MoreBody extends StatefulWidget {
  const MoreBody({super.key});

  @override
  State<MoreBody> createState() => _MoreBodyState();
}

class _MoreBodyState extends State<MoreBody> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            CustomAppBar(title: "Fruit Market", centerTitle: true),
            SizedBox(height: h * 0.03),
            Container(
              height: h * 0.1,
              width: w * 0.23,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                border: Border.all(color: ColorApp.gray),
              ),
              child: Center(
                child: Icon(
                  Icons.person_2_outlined,
                  size: h * 0.06,
                  color: ColorApp.gray,
                ),
              ),
            ),
            SizedBox(height: h * 0.01),
            CustomText(
              fontSize: h * 0.025,
              color: ColorApp.black,
              title: "Welcome, Fruit Market",
              fontFamily: false,
            ),
            SizedBox(height: h * 0.02),
            CustomBottom(
              width: w * 0.8,
              title: "LogIn",
              heightBottom: h * 0.056,
              heightText: h * 0.02,
              colorBottom: ColorApp.green,
              colorText: Colors.white,
            ),
            SizedBox(height: h * 0.04),
            CustomCategoryProfile(
              onTap: () {
                context.go('/profile');
              },
              h: h,
              w: w,
              icon: Icons.person_3_outlined,
              title: "Profile",
            ),
            SizedBox(height: h * 0.04),
            CustomCategoryProfile(
              h: h,
              w: w,
              icon: Icons.menu_open,
              title: "MyOrders",
            ),
            SizedBox(height: h * 0.04),
            CustomCategoryProfile(
              h: h,
              w: w,
              icon: Icons.favorite_border,
              title: "favorite",
            ),
            SizedBox(height: h * 0.04),
            CustomCategoryProfile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => CustomDialogLanguage(h: h, w: w),
                );
              },
              h: h,
              w: w,
              icon: Icons.language,
              title: "language",
            ),
            SizedBox(height: h * 0.04),
            CustomCategoryProfile(
              onTap: () {
                context.go('/contact');
              },
              h: h,
              w: w,
              icon: Icons.headphones_rounded,
              title: "Support",
            ),
            SizedBox(height: h * 0.04),
            CustomCategoryProfile(
              onTap: () {
                context.go('/team');
              },
              h: h,
              w: w,
              icon: Icons.handshake,
              title: "Terms & Conditions",
            ),
            SizedBox(height: h * 0.04),
            CustomCategoryProfile(
              h: h,
              w: w,
              icon: Icons.info_outline,
              title: "About Us",
            ),
          ],
        ),
      ),
    );
  }
}

