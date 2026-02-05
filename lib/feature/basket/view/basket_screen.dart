import 'package:flutter/material.dart';
import 'package:fruits_app/feature/basket/view/widgets/basket_body.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: BasketBody(),
      ),
    );
  }
}