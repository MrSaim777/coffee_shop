import 'package:coffee_shop/data/models/coffee.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt selectedListType = 0.obs;
  List<String> coffeeTypes = ['Cappuccino', 'Machiato', 'Latte', 'Americano'];
  RxBool refreshCartBtn = true.obs;

  selectListType(int index) {
    selectedListType.value = index;
  }

  String flavor(CoffeeFlavor coffeeFlavor) {
    switch (coffeeFlavor) {
      case CoffeeFlavor.Chocolate:
        return 'Chocolate';
      case CoffeeFlavor.OatMilk:
        return 'Oat Milk';
      default:
        return 'Unknown Flavor';
    }
  }
}
