import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/features/coffee_home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Shop',
      theme: ThemeData(
        fontFamily: "Sora",
        colorScheme:
            ColorScheme.fromSeed(seedColor: AppColors.homeContainerGradient1),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
