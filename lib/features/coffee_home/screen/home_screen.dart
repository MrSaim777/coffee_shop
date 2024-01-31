import 'package:coffee_shop/features/coffee_home/controller/home_controller.dart';
import 'package:coffee_shop/features/coffee_home/widgets/coffee_grid.dart';
import 'package:coffee_shop/features/coffee_home/widgets/home_stack.dart';
import 'package:coffee_shop/features/coffee_home/widgets/types_list.dart';
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
            buildGridView(context, controller),
            SizedBox(height: context.height / 50),
          ],
        ),
      ),
    );
  }
}
