import 'package:flutter/material.dart';

class CustomNavBox extends StatelessWidget {
  const CustomNavBox({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Icon(icon,color: Color(0xFF1F4F3A)),
          const SizedBox(width: 6),
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF1F4F3A),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
