import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_text.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.onTap,
    this.centerTitle = false,
    required this.title,
    this.addIcons = false,this.icon1,this.icon2, this.onTap1, this.onTap2,
  });
  final Function()? onTap;
  final Function()? onTap1;
  final Function()? onTap2;
  final bool centerTitle;
  final String title;
  final bool addIcons;
  final IconData? icon1;
  final IconData? icon2;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: h * 0.02),
          child: Column(
            children: [
              Container(
                height: h * 0.06,
                child: Row(
                  children: [
                    centerTitle ? GestureDetector(
                      onTap: onTap,
                      child: Icon(Icons.arrow_back_ios)) : SizedBox(),
                    Expanded(
                      child: centerTitle
                          ? Center(
                              child: CustomText(
                                fontSize: h * 0.03,
                                color: ColorApp.green,
                                title: title,
                              ),
                            )
                          : CustomText(
                              fontSize: h * 0.03,
                              color: ColorApp.green,
                              title: title,
                            ),
                    ),
                    addIcons
                        ? SizedBox()
                        : Container(
                            child: Row(
                              children: [
                                icon1==null? SizedBox() :GestureDetector(
                                  onTap: onTap1,
                                  child: Icon(icon1, color: ColorApp.green)),
                                SizedBox(width: h*0.01,),
                                GestureDetector(
                                  onTap: onTap2,
                                  child:icon2==null? SizedBox(): Icon(icon2, color: ColorApp.green),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
