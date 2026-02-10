import 'package:flutter/material.dart';
import 'package:fruits_app/feature/order_tracking/view/widgets/order_tracking_body.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: OrderTrackingBody());
  }
}
