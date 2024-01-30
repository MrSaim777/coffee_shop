import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/common/constants/icons.dart';
import 'package:coffee_shop/features/bottom_navigation/controller/bottom_nav_controller.dart';
import 'package:coffee_shop/features/bottom_navigation/widgets/icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavController());
    return Scaffold(
      body: Obx(
        () => IndexedStack(
            index: controller.selectedIndex.value,
            children: controller.screens),
      ),
      bottomNavigationBar: Container(
        height: context.height / 10,
        decoration: const BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24))),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomNavIcon(
                onTap: () => controller.selectIndex(0),
                icon: AssetIcons.home,
                isSelected: controller.selectedIndex.value == 0 ? true : false,
              ),
              BottomNavIcon(
                onTap: () => controller.selectIndex(1),
                icon: AssetIcons.heart,
                isSelected: controller.selectedIndex.value == 1 ? true : false,
              ),
              BottomNavIcon(
                onTap: () => controller.selectIndex(2),
                icon: AssetIcons.bag,
                isSelected: controller.selectedIndex.value == 2 ? true : false,
              ),
              BottomNavIcon(
                onTap: () => controller.selectIndex(3),
                icon: AssetIcons.notification,
                isSelected: controller.selectedIndex.value == 3 ? true : false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
