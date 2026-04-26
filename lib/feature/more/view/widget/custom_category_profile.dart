import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_text.dart';

class CustomCategoryProfile extends StatelessWidget {
  const CustomCategoryProfile({
    super.key,
    required this.h,
    required this.w,
    required this.icon,
    required this.title,
    this.onTap,  this.orientation=false,
  });

  final double h;
  final double w;
  final IconData icon;
  final String title;
  final void Function()? onTap;
  final bool orientation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: h * 0.025),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    Icon(icon, size:orientation?h*0.03:h*0.05, color: ColorApp.green),
                    SizedBox(width: w * 0.02),
                    CustomText(
                      fontSize:orientation? h*0.019:h*0.03,
                      color: ColorApp.black,
                      title: title,
                      fontFamily: false,
                    ),
                  ],
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: ColorApp.gray,size: orientation?h*0.02:h*0.03,),
          ],
        ),
      ),
    );
  }
}
