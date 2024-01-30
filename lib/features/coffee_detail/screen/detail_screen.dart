import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/common/constants/icons.dart';
import 'package:coffee_shop/common/utils/app_text_style.dart';
import 'package:coffee_shop/data/models/coffee.dart';
import 'package:coffee_shop/features/coffee_detail/controller/detail_controller.dart';
import 'package:coffee_shop/features/coffee_home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class CoffeeDetailScreen extends StatelessWidget {
  const CoffeeDetailScreen({super.key, required this.coffee});

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final detailController = Get.put(DetailController());
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width / 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildImage(context),
              SizedBox(height: context.height / 80),
              buildTitle(context, homeController),
              const Divider(color: AppColors.dividerColor),
              SizedBox(height: context.height / 80),
              buildDescription(context),
              SizedBox(height: context.height / 80),
              buildSize(context, detailController),
              SizedBox(height: context.height / 25),
              buildPrice(context),
              SizedBox(height: context.height / 25),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildPrice(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width / 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price",
                style: appTextStyle(
                    textColor: AppColors.coffeeFlavorColor, fontSize: 0.03),
              ),
              Text(
                '\$ ${coffee.price}',
                style: appTextStyle(
                    fontSize: 0.036,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.buttonColor),
              )
            ],
          ),
          InkWell(
            child: Container(
              height: context.height / 14,
              width: context.width / 1.6,
              decoration: BoxDecoration(
                  color: AppColors.buttonColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "Buy Now",
                  style: appTextStyle(
                      textColor: AppColors.whiteColor,
                      fontSize: 0.03,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

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

  Padding buildDescription(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width / 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: appTextStyle(
                fontSize: 0.032,
                fontWeight: FontWeight.bold,
                textColor: AppColors.blackColor),
          ),
          SizedBox(height: context.height / 100),
          ReadMoreText(
            coffee.description,
            trimLines: 3,
            colorClickableText: AppColors.buttonColor,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Read more',
            trimExpandedText: 'Read less',
            textAlign: TextAlign.justify,
            style: appTextStyle(
              textColor: AppColors.coffeeFlavorColor,
              fontSize: 0.026,
            ),
            lessStyle: appTextStyle(
                textColor: AppColors.buttonColor,
                fontSize: 0.026,
                fontWeight: FontWeight.bold),
            moreStyle: appTextStyle(
                textColor: AppColors.buttonColor,
                fontSize: 0.026,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  SizedBox buildTitle(BuildContext context, HomeController homeController) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width / 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              coffee.name,
              style: appTextStyle(
                  fontSize: 0.036,
                  fontWeight: FontWeight.bold,
                  textColor: AppColors.blackColor),
            ),
            Text(
              'with ${homeController.flavor(coffee.flavor)}',
              style: appTextStyle(
                  textColor: AppColors.coffeeFlavorColor, fontSize: 0.026),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(AssetIcons.star, width: context.width / 16),
                    SizedBox(width: context.width / 100),
                    Text(
                      coffee.rating.toString(),
                      style: appTextStyle(
                          fontSize: 0.03,
                          fontWeight: FontWeight.bold,
                          textColor: AppColors.blackColor),
                    ),
                    Text(
                      "(${coffee.allRatings})",
                      style: appTextStyle(textColor: AppColors.allRatingColor),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(context.width / 40),
                      decoration: BoxDecoration(
                          color: AppColors.scaffoldColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Image.asset(AssetIcons.bean,
                              width: context.width / 16)),
                    ),
                    SizedBox(width: context.width / 50),
                    Container(
                      padding: EdgeInsets.all(context.width / 40),
                      decoration: BoxDecoration(
                          color: AppColors.scaffoldColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Image.asset(AssetIcons.mask,
                              width: context.width / 16)),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Image buildImage(BuildContext context) {
    return Image.asset(
      coffee.image,
      height: context.height / 3,
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }

  AppBar buildAppBar(BuildContext context) {
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
            child: SvgPicture.asset(AssetSvg.heart, width: context.width / 12),
          )
        ]);
  }
}

// ignore: must_be_immutable
class SizeContainer extends StatelessWidget {
  SizeContainer(
      {super.key,
      required this.title,
      this.isSelected = false,
      required this.onTap});
  bool isSelected;
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: context.height / 20,
        width: context.width / 4,
        decoration: BoxDecoration(
            color: isSelected
                ? AppColors.priceContainerSelectedColor
                : AppColors.whiteColor,
            border: Border.all(
                color: isSelected
                    ? AppColors.buttonColor
                    : AppColors.priceContainerBorderColor),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(title,
                style: appTextStyle(
                    fontSize: 0.026,
                    textColor: isSelected
                        ? AppColors.buttonColor
                        : AppColors.blackColor))),
      ),
    );
  }
}
