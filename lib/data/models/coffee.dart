// ignore_for_file: constant_identifier_names

enum CoffeeType { Cappuccino, Machiato, Latte, Americano }

enum CoffeeFlavor { Chocolate, OatMilk }

enum CoffeeSize { Small, Medium, Large }

class Coffee {
  final int id;
  final String name;
  final String image;
  final String description;
  final CoffeeType type;
  final CoffeeFlavor flavor;
  final CoffeeSize size;
  final double price;
  double rating;
  int allRatings;
  bool isFavorite;
  bool isInCart;

  Coffee({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.type,
    required this.flavor,
    required this.size,
    required this.price,
    this.rating = 0.0,
    this.allRatings = 0,
    this.isFavorite = false,
    this.isInCart = false,
  });
}
