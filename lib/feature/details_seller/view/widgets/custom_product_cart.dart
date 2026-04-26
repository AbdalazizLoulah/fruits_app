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
    final orientation =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.h * 0.01),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: widget.h * 0.01),
            child: Container(
              height:orientation? widget.h * 0.14:widget.h*0.16,
              width:orientation? double.infinity:widget. w*2,
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
                                      fontSize:orientation? widget.h * 0.02 :widget. h*0.03,
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
                                fontSize:orientation? widget.h * 0.017:widget.h*0.02,
                                color: ColorApp.gray,
                                title: " 12.00KD",
                              ),
                            ],
                          ),
                          SizedBox(height: widget.h * 0.01),
                          widget.title.isEmpty
                              ? Container(
                                  height:orientation? widget.h * 0.03:widget.h*0.045,
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
                                      fontSize: orientation
                                          ? widget.h * 0.016
                                          : widget.h * 0.02,
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
                  widget.add == false
                      ? Column(
                        
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left:widget.addBottom==true?0 :widget.h * 0.02,
                                 bottom: widget.h * 0.03,
                                right:orientation? widget.h * 0.09:widget.h*0.0,
                                top: widget.h * 0.02,
                              ),
                              child: Container(
                                decoration:widget.addBottom==true? BoxDecoration(
                                ):BoxDecoration(
                                        border: Border.all(
                                          color: ColorApp.openGray,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          150,
                                        ),
                                      ),
                                child: Icon(widget.icon, size:orientation? widget.h * 0.03:widget.h*0.04),
                              ),
                            ),
                            widget.addBottom == true
                                ? Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                        right: widget.h * 0.01,
                                        bottom: widget.h * 0.025,
                                        left:  widget.h * 0.01,
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
                                                child: Icon(Icons.add,size:orientation? widget.h*0.02:widget.h*0.04 ,),
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
                                                child: Icon(Icons.remove,
                                                  size: orientation
                                                      ? widget.h * 0.02
                                                      : widget.h * 0.04,
                                                ),
                                              ),
                                            ],
                                          ),
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
