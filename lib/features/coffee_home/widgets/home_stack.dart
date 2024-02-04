import 'package:animate_do/animate_do.dart';
import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/common/constants/icons.dart';
import 'package:coffee_shop/common/constants/images.dart';
import 'package:coffee_shop/common/utils/app_text_style.dart';
import 'package:coffee_shop/data/coffees_list.dart';
import 'package:coffee_shop/features/coffee_home/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Stack buildHomeStack(BuildContext context) {
  return Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.center,
    children: [
      Container(
        height: context.height / 3,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
              AppColors.homeContainerGradient1,
              AppColors.homeContainerGradient2
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: context.height / 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width / 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: appTextStyle(textColor: AppColors.greyColor),
                      ),
                      Row(
                        children: [
                          Text(
                            "Bilzen, Tanjungbalai",
                            style:
                                appTextStyle(textColor: AppColors.whiteColor),
                          ),
                          SizedBox(width: context.width / 100),
                          Image.asset(
                            AssetIcons.arrowDown,
                            color: AppColors.whiteColor,
                            width: context.width / 26,
                          )
                        ],
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ElasticInDown(
                            child: Dialog(
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Container(
                                  height: context.height / 3,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image:
                                              AssetImage(AssetImages.image))),
                                )),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: context.height / 20,
                      width: context.width / 8,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AssetImages.image))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: context.height / 50,
                  horizontal: context.width / 16),
              height: context.height / 16,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.homeContainerGradient2,
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                  child: TextField(
                readOnly: true,
                onTap: () => showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(listOfCoffees)),
                textAlignVertical: TextAlignVertical.center,
                style: const TextStyle(color: AppColors.whiteColor),
                decoration: InputDecoration(
                    hintText: "Search coffee",
                    hintStyle: appTextStyle(
                        textColor: AppColors.searchHintColor, fontSize: 0.028),
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: context.height / 50),
                      child: Image.asset(
                        AssetIcons.search,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    suffixIcon: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: context.width / 100,
                          vertical: context.height * 0.005),
                      width: context.width / 8,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AssetIcons.filter))),
                    )),
              )),
            )
          ],
        ),
      ),
      Positioned(
        bottom: -context.height / 12,
        child: FadeInLeftBig(
          child: Container(
            height: context.height / 6,
            width: context.width / 1.14,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(AssetImages.buyOne))),
          ),
        ),
      ),
    ],
  );
}
