  import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/common/constants/icons.dart';
import 'package:coffee_shop/common/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Padding buildAddress(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width / 20, vertical: context.height / 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Delivery Address",
              style: appTextStyle(fontSize: 0.03, fontWeight: FontWeight.bold)),
          SizedBox(height: context.height / 100),
          Text("Ji. Kpg Sutoyo",
              style:
                  appTextStyle(fontSize: 0.028, fontWeight: FontWeight.bold)),
          Text("Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai",
              style: appTextStyle(textColor: AppColors.allRatingColor)),
          SizedBox(height: context.height / 50),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: context.width / 30,
                    vertical: context.height / 150),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border:
                        Border.all(color: AppColors.priceContainerBorderColor)),
                child: Center(
                  child: Row(
                    children: [
                      Image.asset(AssetIcons.edit, width: context.width / 22),
                      SizedBox(width: context.width / 50),
                      Text(
                        "Edit Address",
                        style:
                            appTextStyle(textColor: AppColors.editAddressColor),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: context.width / 50),
                padding: EdgeInsets.symmetric(
                    horizontal: context.width / 30,
                    vertical: context.height / 150),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border:
                        Border.all(color: AppColors.priceContainerBorderColor)),
                child: Center(
                  child: Row(
                    children: [
                      Image.asset(AssetIcons.notes, width: context.width / 22),
                      SizedBox(width: context.width / 50),
                      Text(
                        "Add Note",
                        style:
                            appTextStyle(textColor: AppColors.editAddressColor),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
