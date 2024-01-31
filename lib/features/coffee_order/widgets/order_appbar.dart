import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/common/constants/icons.dart';
import 'package:coffee_shop/common/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    backgroundColor: AppColors.whiteColor,
    elevation: 0,
    leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Image.asset(AssetIcons.arrowLeft, width: context.width / 12)),
    title: Text(
      "Order",
      style: appTextStyle(
          textColor: AppColors.blackColor,
          fontWeight: FontWeight.bold,
          fontSize: 0.032),
    ),
  );
}
