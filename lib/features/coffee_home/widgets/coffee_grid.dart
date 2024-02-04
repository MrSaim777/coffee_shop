import 'package:animate_do/animate_do.dart';
import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/common/constants/icons.dart';
import 'package:coffee_shop/common/utils/app_text_style.dart';
import 'package:coffee_shop/common/routes/routes.dart';
import 'package:coffee_shop/data/coffees_list.dart';
import 'package:coffee_shop/features/coffee_home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

FadeInUpBig buildGridView(BuildContext context, HomeController controller) {
  return FadeInUpBig(
    child: GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: context.width / 16),
      itemCount: listOfCoffees.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: context.width / 20,
          mainAxisExtent: context.height / 3.2,
          mainAxisSpacing: context.width / 50),
      itemBuilder: (context, index) {
        var list = listOfCoffees[index];
        return InkWell(
          onTap: () =>
              Navigator.pushNamed(context, AppRoutes.detail, arguments: list),
          child: Container(
            padding: EdgeInsets.all(context.width / 100),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Hero(
                      tag: list.id,
                      child: SizedBox(
                          height: context.height / 6,
                          width: double.infinity,
                          child: Image.asset(
                            list.image,
                            fit: BoxFit.fill,
                          )),
                    ),
                    Positioned(
                      left: context.width / 50,
                      top: context.height / 200,
                      child: Row(
                        children: [
                          Image.asset(AssetIcons.star,
                              width: context.width / 35),
                          SizedBox(width: context.width / 100),
                          Text(
                            list.rating.toString(),
                            style: appTextStyle(
                                fontSize: 0.02,
                                fontWeight: FontWeight.bold,
                                textColor: AppColors.whiteColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.width / 50,
                      vertical: context.height / 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        list.name,
                        style: appTextStyle(
                            fontSize: 0.028,
                            fontWeight: FontWeight.bold,
                            textColor: AppColors.blackColor),
                      ),
                      Text(
                        'with ${controller.flavor(list.flavor)}',
                        style: appTextStyle(
                            textColor: AppColors.coffeeFlavorColor),
                      ),
                      SizedBox(height: context.height / 100),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$ ${list.price}',
                            style: appTextStyle(
                                fontSize: 0.03,
                                fontWeight: FontWeight.bold,
                                textColor: AppColors.coffeePriceColor),
                          ),
                          InkWell(
                              onTap: list.isInCart
                                  ? null
                                  : () {
                                      list.isInCart = true;
                                      controller.refreshCartBtn.refresh();
                                    },
                              child: Obx(() => controller.refreshCartBtn.value
                                  ? Container(
                                      height: context.height / 25,
                                      width: context.width / 10,
                                      decoration: BoxDecoration(
                                          color: list.isInCart
                                              ? AppColors.blackColor
                                              : AppColors.buttonColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Icon(
                                              list.isInCart
                                                  ? Icons.done
                                                  : Icons.add,
                                              color: AppColors.whiteColor,
                                              size: context.width / 20)),
                                    )
                                  : Container(
                                      height: context.height / 25,
                                      width: context.width / 10,
                                      decoration: BoxDecoration(
                                          color: list.isInCart
                                              ? AppColors.blackColor
                                              : AppColors.buttonColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Icon(
                                              list.isInCart
                                                  ? Icons.done
                                                  : Icons.add,
                                              color: AppColors.whiteColor,
                                              size: context.width / 20)),
                                    )))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
