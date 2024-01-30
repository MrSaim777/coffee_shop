import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/config/routes/routes.dart';
import 'package:coffee_shop/config/routes/routes_generator.dart';
import 'package:coffee_shop/features/bottom_navigation/widgets/bottom_nav.dart';
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
      initialRoute: AppRoutes.defaultRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldColor,
        fontFamily: "Sora",
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      home: const AppBottomNav(),
    );
  }
}
