import 'package:coffee_shop/common/constants/colors.dart';
import 'package:coffee_shop/common/constants/icons.dart';
import 'package:coffee_shop/common/utils/app_text_style.dart';
import 'package:coffee_shop/common/utils/container_shadow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Container buildDeliveryProgress(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: context.width / 15),
    height: context.height / 2.6,
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      boxShadow: boxShadow,
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30), topLeft: Radius.circular(30)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: context.height / 50),
        Container(
          height: context.height / 200,
          width: context.width / 10,
          decoration: BoxDecoration(
              color: AppColors.dividerColor,
              borderRadius: BorderRadius.circular(30)),
        ),
        SizedBox(height: context.height / 50),
        Text("10 minutes left",
            style: appTextStyle(fontWeight: FontWeight.bold, fontSize: 0.03)),
        SizedBox(height: context.height / 200),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Delivery to ",
              style: appTextStyle(textColor: AppColors.allRatingColor)),
          TextSpan(
              text: "JI. Kpg Sutoyo",
              style: appTextStyle(fontWeight: FontWeight.bold))
        ])),
        SizedBox(height: context.height / 50),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProgressContainer(color: AppColors.progressColor),
            ProgressContainer(color: AppColors.progressColor),
            ProgressContainer(color: AppColors.progressColor),
            ProgressContainer(color: AppColors.dividerColor),
          ],
        ),
        Container(
          height: context.height / 10,
          width: double.infinity,
          margin: EdgeInsets.only(top: context.height / 50),
          padding: EdgeInsets.symmetric(
              horizontal: context.width / 40, vertical: context.height / 80),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.priceContainerBorderColor),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(context.width / 30),
                margin: EdgeInsets.only(right: context.width / 50),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColors.priceContainerBorderColor),
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset(AssetIcons.riderLeft,
                    width: context.width / 12),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Delivered your order',
                        style: appTextStyle(
                            fontSize: 0.026, fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Text(
                          "We deliver your goods to you in the shortes possible time.",
                          style: appTextStyle(
                              textColor: AppColors.allRatingColor)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: context.height / 50),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image.asset(AssetIcons.person),
          title: Text(
            "Johan Hawn",
            style: appTextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Personal Courier",
            style: appTextStyle(),
          ),
          trailing: Container(
            padding: EdgeInsets.all(context.width / 25),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.priceContainerBorderColor),
                borderRadius: BorderRadius.circular(15)),
            child: Image.asset(AssetIcons.phone),
          ),
        )
      ],
    ),
  );
}

class ProgressContainer extends StatelessWidget {
  const ProgressContainer({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height / 200,
      // width: context.width / 10,
      width: 71.25,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
    );
  }
}
