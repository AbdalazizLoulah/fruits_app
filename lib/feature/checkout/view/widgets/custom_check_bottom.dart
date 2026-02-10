import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/core/widget/custom_circle.dart';
import 'package:fruits_app/core/widget/custom_text.dart';

class CustomCheckBottom extends StatefulWidget {
  const CustomCheckBottom({
    super.key,
    required this.heightContainer,
    required this.colorText,
    required this.h,
    required this.title,
    this.add = false,
    this.onTap,
    this.isSelect = false,
    this.addIcon = false,
    this.icon,
    this.addImage = false,
    this.image,
  });

  final double heightContainer;
  final Color colorText;
  final double h;
  final String title;
  final bool add;
  final void Function()? onTap;
  final bool isSelect;
  final bool addIcon;
  final IconData? icon;
  final bool addImage;
  final String? image;
  @override
  State<CustomCheckBottom> createState() => _CustomCheckBottomState();
}

class _CustomCheckBottomState extends State<CustomCheckBottom> {
  DateTime? selectedDate;

  Future<void> pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2027),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      height: widget.heightContainer,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: widget.h * 0.022,
          vertical: widget.h * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                widget.addImage
                    ? SvgPicture.asset(widget.image.toString())
                    : Text(""),
                    
                Expanded(
                  child: CustomText(
                    fontSize: widget.h * 0.015,
                    color: widget.colorText,
                    title: widget.title,
                  ),
                ),
                widget.addIcon
                    ? widget.icon == null
                          ? CustomBottom(
                              width: widget.h * 0.06,
                              title: "Apply",
                              heightBottom: widget.h * 0.03,
                              heightText: widget.h * 0.012,
                              colorBottom: ColorApp.green,
                              colorText: Colors.white,
                            )
                          : Icon(widget.icon, size: widget.h * 0.04)
                    : CustomCircle(
                        h: widget.h,
                        onTap: widget.onTap,
                        isSelect: widget.isSelect,
                      ),
              ],
            ),
            widget.add
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: widget.h * 0.01),
                      CustomText(
                        fontSize: widget.h * 0.015,
                        color: ColorApp.gray,
                        title: "Select Date",
                      ),
                      TextField(
                        style: TextStyle(
                          color: const Color.fromARGB(255, 20, 101, 22),
                          fontSize: widget.h * 0.02,
                        ),
                        readOnly: true,
                        controller: TextEditingController(
                          text: selectedDate == null
                              ? ""
                              : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                        ),
                        onTap: () {
                          pickDate(context);
                        },
                        decoration: const InputDecoration(
                          hintText: "SelectDate",
                          hintStyle: TextStyle(color: Colors.green),
                          suffixIcon: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
