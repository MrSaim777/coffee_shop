import 'package:coffee_shop/data/models/coffee.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  Rx<CoffeeSize> selectedSize = Rx(CoffeeSize.Medium);
  RxBool refreshBtn = false.obs;

  toggleFavBtn(
    Coffee coffee,
  ) {
    if (coffee.isFavorite) {
      coffee.isFavorite = false;
    } else {
      coffee.isFavorite = true;
    }
    refreshBtn.refresh();
  }

  selectSize(CoffeeSize size) {
    selectedSize.value = size;
  }
}
