import 'package:flutter/material.dart';
import 'package:fruits_app/feature/prouduct_details/view/widgets/product_details_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProductDetailsBody(),
    );
  }
}