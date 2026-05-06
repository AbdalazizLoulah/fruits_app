import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/core/widget/custom_link_page.dart';
import 'package:fruits_app/core/widget/custom_name_app.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreenBody extends StatelessWidget {
  const WelcomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h * 0.09),
            Icon(Icons.close),
            SizedBox(height: h * 0.07),
            CustomNameApp(des: "Welcome to Our app".tr()),
            SizedBox(height: h * 0.03),
            CustomBottom(
              onTap: () {
                context.push('/logIn');
              },
              icon: Icons.phone,
              width: h * 0.4,
              colorText: Colors.black,
              title: "signInWithPhone".tr(),
              heightBottom: h * 0.06,
              heightText: h * 0.015,
              colorBottom: Colors.white,
            ),
            SizedBox(height: h * 0.03),
            CustomBottom(
              addIcon: true,
              width: h * 0.4,
              colorText: Colors.black,
              title: "signInWithGoogle".tr(),
              heightBottom: h * 0.06,
              heightText: h * 0.015,
              colorBottom: Colors.white,
            ),
            SizedBox(height: h * 0.03),
            CustomBottom(
              icon: Icons.facebook_sharp,
              width: h * 0.4,
              colorText: Colors.white,
              title: "signInWithFacebook".tr(),
              heightBottom: h * 0.06,
              heightText: h * 0.015,
              colorBottom: ColorApp.blue,
            ),
            SizedBox(height: h * 0.08),
            CustomLinkPage(
              height: h * 0.02,
              onTap: () {
                context.push('/logIn');
              },
              title: 'alreadyMember '.tr(),
              link: 'signIn'.tr(),
            ),
            SizedBox(height: h * 0.07),
            // Terms & Privacy
            Center(
              child: Text.rich(
                TextSpan(
                  text: 'termsAndPrivacy'.tr(),
                  style: TextStyle(color: Colors.grey, fontSize: h * 0.02),
                  children: [
                    TextSpan(
                      text: 'terms'.tr(),
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Terms tapped'.tr());
                        },
                    ),
                    const TextSpan(text: ' and our '),
                    TextSpan(
                      text: 'privacy'.tr(),
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Privacy tapped'.tr());
                        },
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
