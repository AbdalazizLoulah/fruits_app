import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_text.dart';

class CustomProductCart extends StatefulWidget {
  const CustomProductCart({
    super.key,
    required this.h,
    required this.w,
    this.add = true,
    this.addBottom = true,
    this.icon,
    required this.title,
  });

  final double h;
  final double w;
  final bool? add;
  final bool? addBottom;
  final IconData? icon;
  final String title;

  @override
  State<CustomProductCart> createState() => _CustomProductCartState();
}

class _CustomProductCartState extends State<CustomProductCart> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.h * 0.01),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: widget.h * 0.01),
            child: Container(
              height: widget.h * 0.14,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
                    spreadRadius: 0.1,
                    offset: Offset(0, 5),
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: widget.h * 0.01,
                      left: widget.h * 0.01,
                      bottom: widget.h * 0.01,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(50),
                      child: Image.asset("assets/image/Fruits.png"),
                    ),
                  ),
                  SizedBox(width: widget.w * 0.03),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: widget.h * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    CustomText(
                                      fontSize: widget.h * 0.016,
                                      color: Colors.black,
                                      title: "Product name",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: widget.h * 0.01),
                          Row(
                            children: [
                              CustomText(
                                fontSize: widget.h * 0.013,
                                color: ColorApp.gray,
                                title: " 12.00KD",
                              ),
                            ],
                          ),
                          SizedBox(height: widget.h * 0.01),
                          widget.title.isEmpty
                              ? Container(
                                  height: widget.h * 0.03,
                                  width: widget.w * 0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color.fromARGB(
                                      255,
                                      215,
                                      132,
                                      126,
                                    ),
                                  ),
                                  child: Center(
                                    child: CustomText(
                                      fontSize: widget.h * 0.013,
                                      color: Colors.white,
                                      title: " Up to 10% Off",
                                    ),
                                  ),
                                )
                              : CustomText(
                                  fontSize: widget.h * 0.013,
                                  color: Colors.black,
                                  title: widget.title,
                                ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: widget.w * 0.04),
                  widget.add == false
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: widget.h * 0.09,
                                bottom: widget.h * 0.06,
                                right: widget.h * 0.01,
                              ),
                              child: Icon(widget.icon, size: widget.h * 0.037),
                            ),
                            widget.addBottom == true
                                ? Padding(
                                    padding: EdgeInsets.only(
                                      right: widget.h * 0.01,
                                    ),
                                    child: Container(
                                      height: widget.h * 0.035,
                                      width: widget.h * 0.133,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.2,
                                            ),
                                            blurRadius: 10,
                                            spreadRadius: 2,
                                            offset: Offset(
                                              0,
                                              4,
                                            ), // shadow position
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  counter++;
                                                });
                                              },
                                              child: Icon(Icons.add),
                                            ),
                                            Text(
                                              counter.toString(),
                                              style: TextStyle(
                                                fontSize: widget.h * 0.02,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  if (counter > 1) {
                                                    counter--;
                                                  }
                                                });
                                              },
                                              child: Icon(Icons.remove),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        )
                      : Container(
                          child: Image.asset(
                            "assets/image/pasket.png",
                            height: widget.h * 0.07,
                          ),
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
