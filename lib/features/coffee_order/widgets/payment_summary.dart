
  import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/common/utils/app_text_style.dart';
import 'package:coffee_shop/data/models/coffee.dart';
import 'package:coffee_shop/features/coffee_order/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Padding buildPaymentSummary(
      BuildContext context, OrderController orderController,Coffee coffee) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width / 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Payment Summary",
              style: appTextStyle(fontSize: 0.03, fontWeight: FontWeight.bold)),
          SizedBox(height: context.height / 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Price", style: appTextStyle(fontSize: 0.028)),
              Text("\$${coffee.price}",
                  style: appTextStyle(
                      fontSize: 0.028, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: context.height / 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Delivery Fee", style: appTextStyle(fontSize: 0.028)),
              Row(
                children: [
                  Text(
                    "\$2.0",
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: AppColors.blackColor,
                        fontSize: (Get.height + Get.width) / 2 * 0.028),
                  ),
                  SizedBox(width: context.width / 30),
                  Text("\$1",
                      style: appTextStyle(
                          fontSize: 0.028, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          Divider(
              color: AppColors.bigDividerColor,
              thickness: context.height / 400),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total Payment", style: appTextStyle(fontSize: 0.028)),
              Text("\$${orderController.totalPayment(coffee.price)}",
                  style: appTextStyle(
                      fontSize: 0.028, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }