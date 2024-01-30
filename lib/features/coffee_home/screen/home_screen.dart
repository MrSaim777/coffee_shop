import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/common/constants/icons.dart';
import 'package:coffee_shop/common/constants/images.dart';
import 'package:coffee_shop/common/utils/app_text_style.dart';
import 'package:coffee_shop/data/coffees_list.dart';
import 'package:coffee_shop/features/coffee_home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHomeStack(context),
            SizedBox(height: context.height / 12),
            buildCoffeeTypeList(context, controller),
            buildGridView(context, controller)
          ],
        ),
      ),
    );
  }

  GridView buildGridView(BuildContext context, HomeController controller) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: context.width / 16),
      itemCount: listOfCoffees.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: context.width / 20,
          mainAxisExtent: context.height / 3.3,
          mainAxisSpacing: context.width / 50),
      itemBuilder: (context, index) {
        var list = listOfCoffees[index];
        return Container(
          padding: EdgeInsets.all(context.width / 100),
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(list.image),
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
                          fontSize: 0.032,
                          fontWeight: FontWeight.bold,
                          textColor: AppColors.blackColor),
                    ),
                    Text(
                      'with ${controller.flavor(list.flavor)}',
                      style: appTextStyle(
                          fontSize: 0.026,
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
                              fontSize: 0.032,
                              fontWeight: FontWeight.bold,
                              textColor: AppColors.coffeePriceColor),
                        ),
                        InkWell(
                          child: Container(
                            height: context.height / 25,
                            width: context.width / 10,
                            decoration: BoxDecoration(
                                color: AppColors.buttonColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Icon(Icons.add,
                                    color: AppColors.whiteColor,
                                    size: context.width / 20)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  SizedBox buildCoffeeTypeList(
      BuildContext context, HomeController controller) {
    return SizedBox(
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
                          fontSize: 0.028,
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
    );
  }

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
                    Container(
                      height: context.height / 20,
                      width: context.width / 8,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AssetImages.image))),
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
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(color: AppColors.whiteColor),
                  decoration: InputDecoration(
                      hintText: "Search coffee",
                      hintStyle: appTextStyle(
                          textColor: AppColors.searchHintColor,
                          fontSize: 0.028),
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
          child: Container(
            height: context.height / 6,
            width: context.width / 1.14,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(AssetImages.buyOne))),
          ),
        ),
      ],
    );
  }
}
