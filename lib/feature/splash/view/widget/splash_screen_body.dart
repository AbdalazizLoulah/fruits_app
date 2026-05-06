import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }
void _navigate() async {

    await Future.delayed(const Duration(seconds: 3));
    final storage = const FlutterSecureStorage();
    String? token = await storage.read(key: "token");
    if (!mounted) return;

    context.go((token == null || token.isEmpty) ? '/onboard' : '/nav');
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h,
      width: double.infinity,
      child: Stack(
        children: [
          Image.asset(
            width: w,
            "assets/image/background_splash_screen.png",
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(height: h * 0.4, "assets/image/Group 2856.png"),
              Image.asset(
                height: h * 0.4,
                width: w,
                "assets/image/vigitabols_splash_Screen.png",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
