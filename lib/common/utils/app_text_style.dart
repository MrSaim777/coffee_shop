import 'package:coffee_shop/common/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextStyle appTextStyle(
    {FontWeight? fontWeight, double? fontSize, Color? textColor}) {
  return TextStyle(
      color: textColor ?? AppColors.blackColor,
      fontSize: (Get.height + Get.width) / 2 * (fontSize ?? 0.024),
      decoration: TextDecoration.none,
      fontWeight: fontWeight ?? FontWeight.normal);
}
