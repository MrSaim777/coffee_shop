// ignore: must_be_immutable
import 'package:coffee_shop/common/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BottomNavIcon extends StatelessWidget {
  BottomNavIcon(
      {super.key,
      required this.onTap,
      required this.icon,
      this.isSelected = false});
  final VoidCallback onTap;
  final String icon;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
            onTap: onTap,
            child: Image.asset(
              icon,
              width: context.width / 14,
              color: isSelected ? AppColors.buttonColor : null,
            )),
        SizedBox(height: context.height * 0.003),
        Container(
          height: context.height / 100,
          width: context.width / 30,
          decoration: BoxDecoration(
              color: isSelected ? AppColors.buttonColor : null,
              borderRadius: BorderRadius.circular(50)),
        )
      ],
    );
  }
}
