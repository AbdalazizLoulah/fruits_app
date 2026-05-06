
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';

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
  String? token;
  final storage = FlutterSecureStorage();
  @override
  void initState() {
    super.initState();
    getToken();
  }

  Future getToken() async {
    token = await storage.read(key: "token");
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final orientation =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(title: "Fruit Market", centerTitle: true),
              SizedBox(height: h * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: h * 0.02),
                child: Column(
                  children: [
                    Container(
                      height: h * 0.1,
                      width: orientation ? w * 0.23 : w * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        border: Border.all(color: ColorApp.gray),
                      ),
                      child: Center(
                        child: token != null
                            ? ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(
                                  h * 0.05,
                                ),
                                child: Image.asset("assets/image/animal.png"),
                              )
                            : Icon(
                                Icons.person_2_outlined,
                                size: h * 0.06,
                                color: ColorApp.gray,
                              ),
                      ),
                    ),
                    SizedBox(height: h * 0.01),
                    CustomText(
                      fontSize: orientation ? h * 0.025 : h * 0.05,
                      color: ColorApp.black,
                      title: "Welcome, Fruit Market",
                      fontFamily: false,
                    ),
                    SizedBox(height: h * 0.02),
                    CustomBottom(
                      onTap: token != null
                          ? () async {
                            await storage.delete(key: "token");
                            context.go("/logIn");
                              
                            }
                          : () {},
                      width: w * 0.8,
                      title: token == null ? "LogIn" : "log Out",
                      heightBottom: h * 0.056,
                      heightText: h * 0.02,
                      colorBottom: ColorApp.green,
                      colorText: Colors.white,
                    ),
                    SizedBox(height: h * 0.04),
                    CustomCategoryProfile(
                      orientation: orientation,
                      onTap: () {
                        context.push('/profile');
                      },
                      h: h,
                      w: w,
                      icon: Icons.person_3_outlined,
                      title: "Profile",
                    ),
                    SizedBox(height: h * 0.04),
                    CustomCategoryProfile(
                      orientation: orientation,
                      onTap: () {
                        context.push('/nav', extra: 1);
                      },
                      h: h,
                      w: w,
                      icon: Icons.menu_open,
                      title: "MyOrders",
                    ),
                    SizedBox(height: h * 0.04),
                    CustomCategoryProfile(
                      orientation: orientation,
                      onTap: () {
                        context.push('/nav', extra: 3);
                      },
                      h: h,
                      w: w,
                      icon: Icons.favorite_border,
                      title: "favorite",
                    ),
                    SizedBox(height: h * 0.04),
                    CustomCategoryProfile(
                      orientation: orientation,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              CustomDialogLanguage(h: h, w: w),
                        );
                      },
                      h: h,
                      w: w,
                      icon: Icons.language,
                      title: "language",
                    ),
                    SizedBox(height: h * 0.04),
                    CustomCategoryProfile(
                      orientation: orientation,
                      onTap: () {
                        context.push('/contact');
                      },
                      h: h,
                      w: w,
                      icon: Icons.headphones_rounded,
                      title: "Support",
                    ),
                    SizedBox(height: h * 0.04),
                    CustomCategoryProfile(
                      orientation: orientation,
                      onTap: () {
                        context.push('/team');
                      },
                      h: h,
                      w: w,
                      icon: Icons.handshake,
                      title: "Terms & Conditions",
                    ),
                    SizedBox(height: h * 0.04),
                    CustomCategoryProfile(
                      onTap: () {
                        context.push("/aboutUs");
                      },
                      orientation: orientation,
                      h: h,
                      w: w,
                      icon: Icons.info_outline,
                      title: "About Us",
                    ),
                    SizedBox(height: h * 0.05),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
