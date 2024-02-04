import 'package:animate_do/animate_do.dart';
import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/common/utils/app_text_style.dart';
import 'package:coffee_shop/features/coffee_home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

FadeInRightBig buildCoffeeTypeList(
    BuildContext context, HomeController controller) {
  return FadeInRightBig(
    child: SizedBox(
      height: context.height / 10,
      width: double.infinity,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: context.width / 20),
        itemCount: controller.coffeeTypes.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var list = controller.coffeeTypes[index];
          return GestureDetector(
            onTap: () => controller.selectListType(index),
            child: Obx(() => Container(
                  padding: EdgeInsets.symmetric(horizontal: context.width / 20),
                  margin: EdgeInsets.symmetric(
                      horizontal: context.width / 100,
                      vertical: context.height / 40),
                  decoration: controller.selectedListType.value != index
                      ? BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(15))
                      : BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      list,
                      style: appTextStyle(
                          fontSize: 0.026,
                          textColor: controller.selectedListType.value != index
                              ? AppColors.blackColor
                              : AppColors.whiteColor,
                          fontWeight: controller.selectedListType.value != index
                              ? null
                              : FontWeight.bold),
                    ),
                  ),
                )),
          );
        },
      ),
    ),
  );
}
