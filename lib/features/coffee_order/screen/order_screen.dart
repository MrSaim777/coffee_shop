import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/data/models/coffee.dart';
import 'package:coffee_shop/features/coffee_order/controller/order_controller.dart';
import 'package:coffee_shop/features/coffee_order/widgets/address.dart';
import 'package:coffee_shop/features/coffee_order/widgets/bottom_container.dart';
import 'package:coffee_shop/features/coffee_order/widgets/delivery_pickup.dart';
import 'package:coffee_shop/features/coffee_order/widgets/discount.dart';
import 'package:coffee_shop/features/coffee_order/widgets/order_appbar.dart';
import 'package:coffee_shop/features/coffee_order/widgets/payment_summary.dart';
import 'package:coffee_shop/features/coffee_order/widgets/quantity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key, required this.coffee});
  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    final orderController = Get.put(OrderController());
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: buildAppBar(context),
        bottomNavigationBar:
            buildBottomContainer(context, orderController, coffee),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            buildDeliveryPickup(context, orderController),
            buildAddress(context),
            Divider(
                color: AppColors.dividerColor,
                indent: context.width / 20,
                endIndent: context.width / 20),
            buildQuantity(context, orderController, coffee),
            Divider(
                color: AppColors.bigDividerColor,
                thickness: context.height / 200),
            buildDiscount(context),
            buildPaymentSummary(context, orderController, coffee),
          ]),
        ));
  }
}
