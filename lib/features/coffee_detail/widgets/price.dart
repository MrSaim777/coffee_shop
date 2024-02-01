  import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/common/utils/app_text_style.dart';
import 'package:coffee_shop/common/routes/routes.dart';
import 'package:coffee_shop/data/models/coffee.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Padding buildPrice(BuildContext context,Coffee coffee) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width / 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price",
                style: appTextStyle(
                    textColor: AppColors.coffeeFlavorColor, fontSize: 0.03),
              ),
              Text(
                '\$ ${coffee.price}',
                style: appTextStyle(
                    fontSize: 0.036,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.buttonColor),
              )
            ],
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, AppRoutes.order,
                arguments: coffee),
            child: Container(
              height: context.height / 14,
              width: context.width / 1.6,
              decoration: BoxDecoration(
                  color: AppColors.buttonColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "Buy Now",
                  style: appTextStyle(
                      textColor: AppColors.whiteColor,
                      fontSize: 0.03,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
