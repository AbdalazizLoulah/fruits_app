import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomListViewLoading extends StatelessWidget {
  const CustomListViewLoading({
    super.key,
    required this.h,
  });

  final double h;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h*0.5,
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, count) {
          return Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.black,
            enabled: true,
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: h*0.01),
              child: Container(
                height: h * 0.15,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 10,
                      spreadRadius: 0.1,
                      offset: Offset(0, 5),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
