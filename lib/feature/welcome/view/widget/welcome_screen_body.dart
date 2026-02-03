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
            CustomNameApp(des: "Welcome to Our app"),
            SizedBox(height: h * 0.03),
            CustomBottom(
              onTap: () {
                context.go('/logIn');
              },
              icon: Icons.phone,
              width: h * 0.4,
              colorText: Colors.black,
              title: "Sign in with Phone Number",
              heightBottom: h * 0.06,
              heightText: h * 0.015,
              colorBottom: Colors.white,
            ),
            SizedBox(height: h * 0.03),
            CustomBottom(
              addIcon: true,
              width: h * 0.4,
              colorText: Colors.black,
              title: "Sign in with Google",
              heightBottom: h * 0.06,
              heightText: h * 0.015,
              colorBottom: Colors.white,
            ),
            SizedBox(height: h * 0.03),
            CustomBottom(
              icon: Icons.facebook_sharp,
              width: h * 0.4,
              colorText: Colors.white,
              title: "Sign in with FaceBook",
              heightBottom: h * 0.06,
              heightText: h * 0.015,
              colorBottom: ColorApp.blue,
            ),
            SizedBox(height: h * 0.08),
            CustomLinkPage(
              height: h * 0.02,
              onTap: () {
                context.go('/logIn');
              },
              title: 'Already member? ',
              link: 'Sign In',
            ),
            SizedBox(height: h * 0.07),
            // Terms & Privacy
            Center(
              child: Text.rich(
                TextSpan(
                  text: 'By continue you agree to our ',
                  style: TextStyle(color: Colors.grey, fontSize: h * 0.02),
                  children: [
                    TextSpan(
                      text: 'Terms of service',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Terms tapped');
                        },
                    ),
                    const TextSpan(text: ' and our '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Privacy tapped');
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
