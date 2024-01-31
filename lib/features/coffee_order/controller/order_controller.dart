import 'package:coffee_shop/data/models/coffee.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  RxInt deliveryOrPickup = 0.obs;
  RxInt quantity = 1.obs;

  

  selectDeliveryOrPickup(int value) {
    deliveryOrPickup.value = value;
  }

  quantityIncrement() {
    quantity.value += 1;
  }

  quantityDecrement() {
    if (quantity > 1) {
      quantity.value -= 1;
    }
  }

  double totalPayment(double price) {
    return price + 1.0;
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
