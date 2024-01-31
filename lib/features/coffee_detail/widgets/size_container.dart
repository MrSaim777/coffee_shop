// ignore: must_be_immutable
import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/common/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SizeContainer extends StatelessWidget {
  SizeContainer(
      {super.key,
      required this.title,
      this.isSelected = false,
      required this.onTap});
  bool isSelected;
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: context.height / 20,
        width: context.width / 4,
        decoration: BoxDecoration(
            color: isSelected
                ? AppColors.priceContainerSelectedColor
                : AppColors.whiteColor,
            border: Border.all(
                color: isSelected
                    ? AppColors.buttonColor
                    : AppColors.priceContainerBorderColor),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(title,
                style: appTextStyle(
                    fontSize: 0.026,
                    textColor: isSelected
                        ? AppColors.buttonColor
                        : AppColors.blackColor))),
      ),
    );
  }
}
