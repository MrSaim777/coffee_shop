import 'package:coffee_shop/common/constants/images.dart';
import 'package:coffee_shop/data/models/coffee.dart';

List<Coffee> listOfCoffees = [
  Coffee(
      id: 1,
      name: "Cappuccino",
      image: AssetImages.c3,
      description:
          'A cappuccino is an approximately 150 ml (5 oz) beverage, consisting of 25 ml of espresso coffee and 85 ml of fresh milk, topped with a creamy foam layer.',
      type: CoffeeType.Cappuccino,
      flavor: CoffeeFlavor.Chocolate,
      size: CoffeeSize.Medium,
      price: 4.53,
      rating: 4.8,
      allRatings: 230),
  Coffee(
      id: 2,
      name: "Cappuccino",
      image: AssetImages.c4,
      description:
          'A cappuccino is an approximately 150 ml (5 oz) beverage, consisting of 25 ml of espresso coffee and 85 ml of fresh milk, topped with a creamy foam layer.',
      type: CoffeeType.Cappuccino,
      flavor: CoffeeFlavor.OatMilk,
      size: CoffeeSize.Medium,
      price: 3.90,
      rating: 4.9,
      allRatings: 267),
  Coffee(
      id: 3,
      name: "Cappuccino",
      image: AssetImages.c2,
      description:
          'A cappuccino is an approximately 150 ml (5 oz) beverage, consisting of 25 ml of espresso coffee and 85 ml of fresh milk, topped with a creamy foam layer.',
      type: CoffeeType.Cappuccino,
      flavor: CoffeeFlavor.OatMilk,
      size: CoffeeSize.Medium,
      price: 5.12,
      rating: 4.5,
      allRatings: 170),
  Coffee(
      id: 4,
      name: "Cappuccino",
      image: AssetImages.c1,
      description:
          'A cappuccino is an approximately 150 ml (5 oz) beverage, consisting of 25 ml of espresso coffee and 85 ml of fresh milk, topped with a creamy foam layer.',
      type: CoffeeType.Cappuccino,
      flavor: CoffeeFlavor.Chocolate,
      size: CoffeeSize.Medium,
      price: 3.87,
      rating: 4.0,
      allRatings: 123),
];
