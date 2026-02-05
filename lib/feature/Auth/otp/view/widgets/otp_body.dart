import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/core/widget/custom_link_page.dart';
import 'package:fruits_app/core/widget/custom_name_app.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class OtpBody extends StatelessWidget {
  const OtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    var h = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: h * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: h * 0.08),
                GestureDetector(
                  onTap: () => context.go('/logIn'),
                  child: Icon(Icons.arrow_back_ios),
                ),
                SizedBox(height: h * 0.08),
                CustomNameApp(des: "Enter Received OTP"),
                SizedBox(height: h * 0.04),
                Center(
                  child: Pinput(scrollPadding: EdgeInsets.all(50),
                    length: 4,
                    defaultPinTheme: PinTheme(
                      width: h*0.07,height: h*0.07,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.grey)),
                    onCompleted: (pin) => print(pin)),
                ),
                SizedBox(height: h * 0.04),
                Center(child: CustomText(fontSize: h * 0.05, color: ColorApp.openGray, title: "60")),
                SizedBox(height: h * 0.04),
                CustomBottom(onTap: () => context.go('/logIn'),
                  width: double.infinity,
                  title: "Confirm",
                  heightBottom: h * 0.06,
                  heightText: h * 0.02,
                  colorBottom: ColorApp.green,
                  colorText: Colors.white,
                ),
                SizedBox(height: h * 0.07),
                CustomLinkPage(
                  height: h * 0.02,
                  title: "Not received? ",
                  link: "Send Again",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
