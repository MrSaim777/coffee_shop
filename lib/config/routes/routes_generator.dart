import 'package:coffee_shop/common/utils/app_text_style.dart';
import 'package:coffee_shop/config/routes/routes.dart';
import 'package:coffee_shop/features/bottom_navigation/widgets/bottom_nav.dart';
import 'package:coffee_shop/features/coffee_home/screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.defaultRoute:
        return CupertinoPageRoute(builder: (context) => const AppBottomNav());
      case AppRoutes.homeScreen:
        return CupertinoPageRoute(
          builder: (context) => const HomeScreen(),
        );

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
