import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/common/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLoaderWidget extends StatelessWidget {
  final String message;
  const AppLoaderWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.whiteColor,
      title: Row(
        children: [
          const CircularProgressIndicator(color: AppColors.buttonColor),
          SizedBox(width: context.width * 0.05),
          Text(
            message,
            style: appTextStyle(),
          ),
        ],
      ),
    );
  }
}
