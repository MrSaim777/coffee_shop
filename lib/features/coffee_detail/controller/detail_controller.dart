import 'package:coffee_shop/data/models/coffee.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  Rx<CoffeeSize> selectedSize = Rx(CoffeeSize.Medium);

  selectSize(CoffeeSize size) {
    selectedSize.value = size;
  }
}
