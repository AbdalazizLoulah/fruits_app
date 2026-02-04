import 'package:flutter/material.dart';

class CustomAnimatedContainer extends StatelessWidget {
  const CustomAnimatedContainer({
    super.key,
    required this.isSelected,
    required this.items, required this.index,
  });

  final bool isSelected;
  final List<Map<String, dynamic>> items;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(
            items[index]["icon"],
            color: isSelected ? Color(0xFF1F6A4A) : Colors.white,
          ),
          if (isSelected) ...[
            const SizedBox(width: 6),
            Text(
              items[index]["label"],
              style: const TextStyle(
                color: Color(0xFF1F6A4A),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
