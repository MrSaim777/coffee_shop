import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/common/utils/app_text_style.dart';
import 'package:coffee_shop/data/models/coffee.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Padding buildSearchItem(BuildContext context, String image, String name,
    CoffeeFlavor coffeeFlavor) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: context.width / 20, vertical: context.height / 100),
    child: Row(
      children: [
        Image.asset(
          image,
          height: context.height / 14,
        ),
        SizedBox(width: context.width / 30),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            name,
            style: appTextStyle(
                fontSize: 0.032,
                fontWeight: FontWeight.bold,
                textColor: AppColors.blackColor),
          ),
          Text(
            'with ${flavor(coffeeFlavor)}',
            style: appTextStyle(
                textColor: AppColors.coffeeFlavorColor, fontSize: 0.022),
          )
        ]),
      ],
    ),
  );
}

String flavor(CoffeeFlavor coffeeFlavor) {
  switch (coffeeFlavor) {
    case CoffeeFlavor.Chocolate:
      return 'Chocolate';
    case CoffeeFlavor.OatMilk:
      return 'Oat Milk';
    default:
      return 'Unknown Flavor';
  }
}
