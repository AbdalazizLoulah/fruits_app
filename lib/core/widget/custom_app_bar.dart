import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.onTap, this.centerTitle = false, required this.title});
  final Function()? onTap;
  final bool centerTitle;
  final String title;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: h*0.02),
          child: Container(
            height: h * 0.06,
            child: Row(
              children: [
                centerTitle ? Icon(Icons.arrow_back_ios) : SizedBox(),
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
                centerTitle? SizedBox() :Container(
                  child: Row(
                    children: [
                      Icon(Icons.search, color: ColorApp.green),
                      GestureDetector(
                        onTap: onTap,
                        child: Icon(Icons.tune, color: ColorApp.green),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider()
      ],
    );
  }
}
