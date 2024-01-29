import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/common/constants/icons.dart';
import 'package:coffee_shop/common/constants/images.dart';
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
            buildCoffeeTypeList(context, controller)
          ],
        ),
      ),
    );
  }

  SizedBox buildCoffeeTypeList(
      BuildContext context, HomeController controller) {
    return SizedBox(
      height: context.height / 10,
      width: double.infinity,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: context.width / 10),
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
                      // horizontal: context.width / 50,
                      vertical: context.height / 50),
                  decoration: controller.selectedListType.value != index
                      ? null
                      : BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      list,
                      style: TextStyle(
                          fontSize: 16,
                          color: controller.selectedListType.value != index
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
                padding: EdgeInsets.symmetric(horizontal: context.width / 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Location",
                          style: TextStyle(color: AppColors.greyColor),
                        ),
                        Row(
                          children: [
                            const Text(
                              "Bilzen, Tanjungbalai",
                              style: TextStyle(color: AppColors.whiteColor),
                            ),
                            Image.asset(
                              AssetIcons.arrowDown,
                              color: AppColors.whiteColor,
                              width: context.width / 25,
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
                    horizontal: context.width / 12),
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
                      hintStyle:
                          const TextStyle(color: AppColors.searchHintColor),
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
            width: context.width / 1.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image: AssetImage(AssetImages.buyOne))),
          ),
        ),
      ],
    );
  }
}
