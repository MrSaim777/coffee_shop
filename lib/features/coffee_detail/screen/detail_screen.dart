import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/common/utils/app_text_style.dart';
import 'package:coffee_shop/data/models/coffee.dart';
import 'package:coffee_shop/features/coffee_detail/controller/detail_controller.dart';
import 'package:coffee_shop/features/coffee_detail/widgets/app_bar.dart';
import 'package:coffee_shop/features/coffee_detail/widgets/price.dart';
import 'package:coffee_shop/features/coffee_detail/widgets/size.dart';
import 'package:coffee_shop/features/coffee_detail/widgets/title.dart';
import 'package:coffee_shop/features/coffee_home/controller/home_controller.dart';
import 'package:flutter/material.dart';
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
      appBar: buildAppBar(context, detailController, coffee),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width / 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildImage(context),
              SizedBox(height: context.height / 80),
              buildTitle(context, homeController, coffee),
              const Divider(color: AppColors.dividerColor),
              SizedBox(height: context.height / 80),
              buildDescription(context),
              SizedBox(height: context.height / 80),
              buildSize(context, detailController),
              SizedBox(height: context.height / 25),
              buildPrice(context, coffee),
              SizedBox(height: context.height / 25),
            ],
          ),
        ),
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

  Hero buildImage(BuildContext context) {
    return Hero(
      tag: coffee.id,
      child: Image.asset(
        coffee.image,
        height: context.height / 3,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
