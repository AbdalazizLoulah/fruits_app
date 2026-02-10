import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/core/widget/custom_circle.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:go_router/go_router.dart';

class CustomDialogLanguage extends StatefulWidget {
  const CustomDialogLanguage({super.key, required this.h, required this.w});
  final double h;
  final double w;

  @override
  State<CustomDialogLanguage> createState() => _CustomDialogLanguageState();
}
class _CustomDialogLanguageState extends State<CustomDialogLanguage> {
  bool arabic = false;
  bool english = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _checkCurrentLanguage();
  }

  void _checkCurrentLanguage() {
    if (context.locale.languageCode == "en") {
      english = true;
      arabic = false;
    } else {
      arabic = true;
      english = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: SizedBox(
        height: widget.h * 0.3,
        child: Padding(
          padding: EdgeInsets.only(top: widget.h * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🇸🇦 Arabic
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: CustomCircle(
                      h: widget.h * 0.5,
                      isSelect: arabic, // 👈 مهم
                      onTap: () {
                        setState(() {
                          arabic = true;
                          english = false;
                        });
                      },
                    ),
                  ),
                  Image.asset("assets/image/ar.png", height: widget.h * 0.02),
                  CustomText(
                    fontSize: widget.h * 0.02,
                    color: ColorApp.gray,
                    title: "العربية",
                    fontFamily: false,
                  ),
                ],
              ),

              /// 🇺🇸 English
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: CustomCircle(
                      h: widget.h * 0.5,
                      isSelect: english, // 👈 مهم
                      onTap: () {
                        setState(() {
                          english = true;
                          arabic = false;
                        });
                      },
                    ),
                  ),
                  Image.asset("assets/image/en.png",height:widget.h*0.02,),
                  CustomText(
                    fontSize: widget.h * 0.015,
                    color: ColorApp.gray,
                    title: "English",
                    fontFamily: false,
                  ),
                ],
              ),

              SizedBox(height: widget.h * 0.03),

              /// Apply Button
              CustomBottom(
                onTap: () {
                  if (arabic) {
                    context.setLocale(const Locale('ar'));
                  } else {
                    context.setLocale(const Locale('en'));
                  }
                  context.pop();
                },
                width: widget.w * 0.5,
                title: "Apply",
                heightBottom: widget.h * 0.06,
                heightText: widget.h * 0.02,
                colorBottom: ColorApp.green,
                colorText: Colors.white,
              ),

              SizedBox(height: widget.h * 0.03),

              GestureDetector(
                onTap: () => context.pop(),
                child: Center(
                  child: CustomText(
                    fontSize: widget.h * 0.03,
                    color: ColorApp.gray,
                    title: "Close",
                    fontFamily: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

