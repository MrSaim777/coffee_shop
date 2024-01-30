import 'package:coffee_shop/common/utils/app_text_style.dart';
import 'package:coffee_shop/features/coffee_home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  RxInt selectedIndex = 0.obs;
  selectIndex(int index) {
    selectedIndex.value = index;
  }

  List<Widget> screens = [
    const HomeScreen(),
    Center(
      child: Text(
        "Favorite Screen",
        style: appTextStyle(),
      ),
    ),
    Center(
      child: Text(
        "Cart Screen",
        style: appTextStyle(),
      ),
    ),
    Center(
      child: Text(
        "Notification Screen",
        style: appTextStyle(),
      ),
    )
  ];
}
