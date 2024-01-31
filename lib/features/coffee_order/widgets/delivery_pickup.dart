import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/common/utils/app_text_style.dart';
import 'package:coffee_shop/features/coffee_order/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Container buildDeliveryPickup(
    BuildContext context, OrderController orderController) {
  return Container(
    margin: EdgeInsets.symmetric(
        horizontal: context.width / 20, vertical: context.height / 50),
    padding: EdgeInsets.symmetric(
        horizontal: context.width / 100, vertical: context.height / 300),
    width: context.width,
    height: context.height / 16,
    decoration: BoxDecoration(
        color: AppColors.deliveryOrPickupBGColor,
        borderRadius: BorderRadius.circular(15)),
    child: Stack(
      children: [
        Obx(
          () => AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            right: orderController.deliveryOrPickup.value == 0
                ? context.width / 2.3
                : 0,
            left: orderController.deliveryOrPickup.value == 1
                ? context.width / 2.3
                : 0,
            top: 0,
            bottom: 0,
            child: Container(
                decoration: BoxDecoration(
                    color: AppColors.buttonColor,
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => orderController.selectDeliveryOrPickup(0),
                child: Center(
                  child: Obx(
                    () => Text(
                      "Deliver",
                      style: appTextStyle(
                          textColor: orderController.deliveryOrPickup.value == 0
                              ? AppColors.whiteColor
                              : AppColors.blackColor,
                          fontSize: 0.03,
                          fontWeight:
                              orderController.deliveryOrPickup.value == 0
                                  ? FontWeight.bold
                                  : FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => orderController.selectDeliveryOrPickup(1),
                child: Center(
                  child: Obx(
                    () => Text(
                      "Pick Up",
                      style: appTextStyle(
                          textColor: orderController.deliveryOrPickup.value == 1
                              ? AppColors.whiteColor
                              : AppColors.blackColor,
                          fontSize: 0.03,
                          fontWeight:
                              orderController.deliveryOrPickup.value == 1
                                  ? FontWeight.bold
                                  : FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
