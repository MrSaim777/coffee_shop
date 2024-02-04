import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/common/utils/app_text_style.dart';
import 'package:coffee_shop/data/models/coffee.dart';
import 'package:coffee_shop/features/coffee_order/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Padding buildQuantity(
    BuildContext context, OrderController orderController, Coffee coffee) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: context.width / 20, vertical: context.height / 100),
    child: Row(
      children: [
        Hero(
          tag: coffee.id,
          child: Image.asset(
            coffee.image,
            height: context.height / 14,
          ),
        ),
        SizedBox(width: context.width / 30),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            coffee.name,
            style: appTextStyle(
                fontSize: 0.032,
                fontWeight: FontWeight.bold,
                textColor: AppColors.blackColor),
          ),
          Text(
            'with ${orderController.flavor(coffee.flavor)}',
            style: appTextStyle(
                textColor: AppColors.coffeeFlavorColor, fontSize: 0.022),
          )
        ]),
        const Spacer(),
        Row(
          children: [
            InkWell(
              onTap: () => orderController.quantityDecrement(),
              child: Obx(
                () => Container(
                  padding: EdgeInsets.all(context.width / 200),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: AppColors.priceContainerBorderColor)),
                  child: Center(
                      child: Icon(Icons.remove,
                          size: context.width / 20,
                          color: orderController.quantity.value > 1
                              ? AppColors.blackColor
                              : AppColors.priceContainerBorderColor)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width / 25),
              child: Obx(
                () => Text(orderController.quantity.value.toString(),
                    style: appTextStyle(
                        fontWeight: FontWeight.bold, fontSize: 0.03)),
              ),
            ),
            InkWell(
              onTap: () => orderController.quantityIncrement(),
              child: Container(
                padding: EdgeInsets.all(context.width / 200),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: AppColors.priceContainerBorderColor)),
                child: Center(
                    child: Icon(Icons.add,
                        size: context.width / 20, color: AppColors.blackColor)),
              ),
            )
          ],
        )
      ],
    ),
  );
}
