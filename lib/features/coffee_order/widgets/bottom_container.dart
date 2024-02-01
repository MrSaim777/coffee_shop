import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/common/constants/icons.dart';
import 'package:coffee_shop/common/utils/app_text_style.dart';
import 'package:coffee_shop/common/routes/routes.dart';
import 'package:coffee_shop/common/utils/container_shadow.dart';
import 'package:coffee_shop/data/models/coffee.dart';
import 'package:coffee_shop/features/coffee_order/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Container buildBottomContainer(
    BuildContext context, OrderController orderController, Coffee coffee) {
  return Container(
    height: context.height / 5,
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: context.width / 20),
    decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        boxShadow: boxShadow),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(AssetIcons.money, width: context.width / 15),
                SizedBox(width: context.width / 20),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.deliveryOrPickupBGColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.width / 30,
                            vertical: context.height / 200),
                        decoration: BoxDecoration(
                            color: AppColors.buttonColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Text(
                            "Cash",
                            style:
                                appTextStyle(textColor: AppColors.whiteColor),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.width / 20),
                        child: Text(
                            "\$${orderController.totalPayment(coffee.price)}",
                            style: appTextStyle()),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Image.asset(AssetIcons.dots, width: context.width / 15),
          ],
        ),
        SizedBox(height: context.height / 50),
        InkWell(
          onTap: () => Navigator.pushNamed(context, AppRoutes.delivery,
              arguments: coffee),
          child: Container(
            height: context.height / 14,
            decoration: BoxDecoration(
                color: AppColors.buttonColor,
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text(
                "Order",
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
