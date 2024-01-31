  import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/common/utils/app_text_style.dart';
import 'package:coffee_shop/data/models/coffee.dart';
import 'package:coffee_shop/features/coffee_detail/controller/detail_controller.dart';
import 'package:coffee_shop/features/coffee_detail/widgets/size_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Padding buildSize(BuildContext context, DetailController detailController) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width / 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Size",
            style: appTextStyle(
                fontSize: 0.032,
                fontWeight: FontWeight.bold,
                textColor: AppColors.blackColor),
          ),
          SizedBox(height: context.height / 100),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizeContainer(
                    onTap: () => detailController.selectSize(CoffeeSize.Small),
                    title: "S",
                    isSelected:
                        detailController.selectedSize.value == CoffeeSize.Small
                            ? true
                            : false),
                SizeContainer(
                    onTap: () => detailController.selectSize(CoffeeSize.Medium),
                    title: "M",
                    isSelected:
                        detailController.selectedSize.value == CoffeeSize.Medium
                            ? true
                            : false),
                SizeContainer(
                    onTap: () => detailController.selectSize(CoffeeSize.Large),
                    title: "L",
                    isSelected:
                        detailController.selectedSize.value == CoffeeSize.Large
                            ? true
                            : false),
              ],
            ),
          )
        ],
      ),
    );
  }
