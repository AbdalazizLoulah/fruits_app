import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_circle.dart';
import 'package:fruits_app/core/widget/custom_text.dart';

class CustomSelectWeight extends StatelessWidget {
  const CustomSelectWeight({
    super.key,
    required this.h,
    required this.title,
    required this.icon,
    this.onTap,
    required this.show, required this.itemCount,
  });

  final double h;
  final String title;
  final IconData icon;
  final bool show;
  final int itemCount;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(fontSize: h * 0.02, color: Colors.black, title: title),
            GestureDetector(
              onTap: onTap,
              child: show
                  ? Icon(Icons.keyboard_arrow_down,
                      size: h * 0.035,
                      color: ColorApp.gray,)
                  : Icon(
                      Icons.keyboard_arrow_up,
                      size: h * 0.035,
                      color: ColorApp.gray,
                    ),
            ),
          ],
        ),
        Divider(),
        show
            ? SizedBox(
                height: h * 0.1,
                child: ListView.builder(
                  itemCount: itemCount,
                  itemBuilder: (context, count) {
                    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: CustomCircle(h: h * 0.5),
                        ),
                      CustomText(fontSize: h*0.015, color: ColorApp.gray, title: "50 Gram - 4.00 KD")
                      ],
                    );
                  },
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
