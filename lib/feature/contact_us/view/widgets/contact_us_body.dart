import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/core/widget/custom_text_form_field.dart';
import 'package:fruits_app/feature/contact_us/view/widgets/custom_social.dart';
import 'package:go_router/go_router.dart';

class ContactUsBody extends StatelessWidget {
  const ContactUsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          SizedBox(height: h * 0.05),
          CustomAppBar(
            title: "Contact Us",
            centerTitle: true,
            onTap: () => context.go('/nav'),
          ),
          SizedBox(height: h * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: h * 0.03),
            child: Column(
              children: [
                CustomTextFormField(
                  h: h,
                  fontSize: h * 0.015,
                  helper: "Name",
                  hint: "",
                  controller: nameController,
                ),
                SizedBox(height: h * 0.02),
                CustomTextFormField(
                  h: h,
                  fontSize: h * 0.015,
                  helper: "Mobile",
                  hint: "",
                  controller: nameController,
                ),
                SizedBox(height: h * 0.02),
                CustomTextFormField(
                  maxLine: 5,
                  h: h,
                  fontSize: h * 0.015,
                  helper: "message",
                  hint: "",
                  controller: nameController,
                ),
                SizedBox(height: h * 0.04),
                CustomBottom(
                  width: w,
                  title: "Submit",
                  heightBottom: h * 0.06,
                  heightText: h * 0.02,
                  colorBottom: ColorApp.green,
                  colorText: Colors.white,
                ),
                SizedBox(height: h * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSocial(
                      h: h,
                      w: w,
                      icon: FontAwesomeIcons.whatsapp,
                      colorIcon: Colors.green,
                    ),
                    CustomSocial(
                      h: h,
                      w: w,
                      icon: FontAwesomeIcons.facebook,
                      colorIcon: Colors.lightBlue,
                    ),
                    CustomSocial(
                      h: h,
                      w: w,
                      icon: FontAwesomeIcons.instagram,
                      colorIcon: Colors.red,
                    ),
                    CustomSocial(
                      h: h,
                      w: w,
                      icon: FontAwesomeIcons.youtube,
                      colorIcon: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
