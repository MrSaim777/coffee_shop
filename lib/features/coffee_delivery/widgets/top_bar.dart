
  import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/common/constants/icons.dart';
import 'package:coffee_shop/common/utils/container_shadow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Row buildDeliveryScreenAppbarWidget(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(context.width / 30),
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: boxShadow),
                  child: Image.asset(
                    AssetIcons.arrowLeft,
                    width: context.width / 14,
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(context.width / 30),
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: boxShadow),
                  child: Image.asset(
                    AssetIcons.gps,
                    width: context.width / 14,
                  ),
                ),
              )
            ],
          );
  }

