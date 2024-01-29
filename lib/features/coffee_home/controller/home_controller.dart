import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt selectedListType = 0.obs;
  List<String> coffeeTypes = ['Cappuccino', 'Machiato', 'Latte', 'Americano'];

  selectListType(int index) {
    selectedListType.value = index;
  }
}
