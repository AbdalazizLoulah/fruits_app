import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomLinkPage extends StatelessWidget {
  const CustomLinkPage({
    super.key,
    required this.height,
    required this.title,
    required this.link, this.onTap,
  });
  final double height;
  final String title;
  final String link;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          text: title,
          style: TextStyle(color: Colors.black, fontSize: height),
          children: [
            TextSpan(
              text: link,
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
