
  import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/common/constants/icons.dart';
import 'package:coffee_shop/common/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Container buildDiscount(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: context.width / 20, vertical: context.height / 50),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.priceContainerBorderColor),
          borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Image.asset(AssetIcons.discount, width: context.width / 16),
        title: Text("1 Discount is applied",
            style: appTextStyle(fontSize: 0.028, fontWeight: FontWeight.bold)),
        trailing: Image.asset(AssetIcons.arrowRight, width: context.width / 16),
      ),
    );
  }
