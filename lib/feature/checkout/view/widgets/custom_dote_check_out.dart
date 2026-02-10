import 'package:flutter/material.dart';

class CustomDoteCheckOut extends StatelessWidget {
  const CustomDoteCheckOut({
    super.key,
    required this.h,
    required this.addWay,
    required this.currentStep, required this.count,
  });

  final double h;
  final bool addWay;
  final int currentStep;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: h * 0.030,
          width: h * 0.030,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: currentStep == count ? Colors.green : Colors.grey,width: 2),
          ),
          child: Center(
            child: Container(
              height: h * 0.01,
              width: h * 0.01,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: currentStep == count ? Colors.green : Colors.grey,
              ),
            ),
          ),
        ),
        count==2 ? Text("") : Text(" - - - - - - - - - - - - - - "),
      ],
    );
  }
}
