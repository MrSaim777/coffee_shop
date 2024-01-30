import 'package:coffee_shop/common/utils/app_text_style.dart';
import 'package:coffee_shop/config/routes/routes.dart';
import 'package:coffee_shop/data/models/coffee.dart';
import 'package:coffee_shop/features/bottom_navigation/widgets/bottom_nav.dart';
import 'package:coffee_shop/features/coffee_detail/screen/detail_screen.dart';
import 'package:coffee_shop/features/coffee_home/screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.defaultRoute:
        return CupertinoPageRoute(builder: (context) => const AppBottomNav());
      case AppRoutes.home:
        return CupertinoPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case AppRoutes.detail:
        final Coffee coffee = settings.arguments as Coffee;
        return CupertinoPageRoute(
          builder: (context) => CoffeeDetailScreen(coffee: coffee),
        );
      // case verification:
      //   final Map args = settings.arguments as Map;
      //   return MaterialPageRoute(
      //     builder: (context) => VerificationPage(
      //       smsCodeId: args['smsCodeId'],
      //       phoneNumber: args['phoneNumber'],
      //     ),
      //   );
      // case userInfo:
      //   final String? profileImageUrl = settings.arguments as String?;
      //   return MaterialPageRoute(
      //     builder: (context) => UserInfoPage(
      //       profileImageUrl: profileImageUrl,
      //     ),
      //   );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Page not found',
              style: appTextStyle(),
            ),
          ),
        ),
      );
    });
  }
}
