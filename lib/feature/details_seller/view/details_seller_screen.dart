import 'package:flutter/material.dart';
import 'package:fruits_app/feature/details_seller/view/widgets/details_seller_body.dart';

class DetailsSellerScreen extends StatelessWidget {
  const DetailsSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DetailsSellerBody(),
    );
  }
}