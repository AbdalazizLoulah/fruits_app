import 'package:flutter/material.dart';
import 'package:fruits_app/feature/basket/view/widgets/basket_body.dart';
import 'package:fruits_app/feature/checkout/view/widgets/check_out_body.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key, required this.data});
  final CheckOut data;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.white, body: CheckOutBody(data:data)),
    );
  }
}
