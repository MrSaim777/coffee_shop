import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/common/constants/icons.dart';
import 'package:coffee_shop/common/utils/app_text_style.dart';
import 'package:coffee_shop/data/models/coffee.dart';
import 'package:coffee_shop/features/coffee_home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

SizedBox buildTitle(BuildContext context, HomeController homeController,Coffee coffee) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width / 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              coffee.name,
              style: appTextStyle(
                  fontSize: 0.036,
                  fontWeight: FontWeight.bold,
                  textColor: AppColors.blackColor),
            ),
            Text(
              'with ${homeController.flavor(coffee.flavor)}',
              style: appTextStyle(
                  textColor: AppColors.coffeeFlavorColor, fontSize: 0.026),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(AssetIcons.star, width: context.width / 16),
                    SizedBox(width: context.width / 100),
                    Text(
                      coffee.rating.toString(),
                      style: appTextStyle(
                          fontSize: 0.03,
                          fontWeight: FontWeight.bold,
                          textColor: AppColors.blackColor),
                    ),
                    Text(
                      "(${coffee.allRatings})",
                      style: appTextStyle(textColor: AppColors.allRatingColor),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(context.width / 40),
                      decoration: BoxDecoration(
                          color: AppColors.scaffoldColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Image.asset(AssetIcons.bean,
                              width: context.width / 16)),
                    ),
                    SizedBox(width: context.width / 50),
                    Container(
                      padding: EdgeInsets.all(context.width / 40),
                      decoration: BoxDecoration(
                          color: AppColors.scaffoldColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Image.asset(AssetIcons.mask,
                              width: context.width / 16)),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }