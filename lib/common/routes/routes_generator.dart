import 'package:coffee_shop/common/utils/app_text_style.dart';
import 'package:coffee_shop/common/routes/routes.dart';
import 'package:coffee_shop/data/models/coffee.dart';
import 'package:coffee_shop/features/bottom_navigation/widgets/bottom_nav.dart';
import 'package:coffee_shop/features/coffee_delivery/screens/delivery_screen.dart';
import 'package:coffee_shop/features/coffee_detail/screen/detail_screen.dart';
import 'package:coffee_shop/features/coffee_home/screen/home_screen.dart';
import 'package:coffee_shop/features/coffee_order/screen/order_screen.dart';
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
          fullscreenDialog: true,
          builder: (context) => CoffeeDetailScreen(coffee: coffee),
        );
      case AppRoutes.order:
        final Coffee coffee = settings.arguments as Coffee;
        return CupertinoPageRoute(
          builder: (context) => OrderScreen(coffee: coffee),
        );
      case AppRoutes.delivery:
        final Coffee coffee = settings.arguments as Coffee;
        return CupertinoPageRoute(
          builder: (context) => DeliveryScreen(coffee: coffee),
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
