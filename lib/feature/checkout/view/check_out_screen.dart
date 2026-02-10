import 'package:flutter/material.dart';
import 'package:fruits_app/feature/checkout/view/widgets/check_out_body.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CheckOutBody(),);
  }
}