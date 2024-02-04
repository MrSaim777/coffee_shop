// ignore_for_file: deprecated_member_use

import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/common/constants/icons.dart';
import 'package:coffee_shop/common/utils/app_text_style.dart';
import 'package:coffee_shop/data/models/coffee.dart';
import 'package:coffee_shop/features/coffee_detail/controller/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

AppBar buildAppBar(
    BuildContext context, DetailController detailController, Coffee coffee) {
  return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Image.asset(AssetIcons.arrowLeft, width: context.width / 12)),
      title: Text(
        "Detail",
        style: appTextStyle(
            textColor: AppColors.blackColor,
            fontWeight: FontWeight.bold,
            fontSize: 0.032),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: context.width / 20),
          child: GestureDetector(
              onTap: () => detailController.toggleFavBtn(coffee),
              child: Obx(
                () => detailController.refreshBtn.value
                    ? SvgPicture.asset(AssetSvg.heart,
                        width: context.width / 12,
                        color: coffee.isFavorite ? Colors.red : null)
                    : SvgPicture.asset(AssetSvg.heart,
                        width: context.width / 12,
                        color: coffee.isFavorite ? Colors.red : null),
              )),
        )
      ]);
}
