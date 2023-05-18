import 'package:flutter/material.dart';

import 'coffee.dart';

class CoffeeShop extends ChangeNotifier{
  // coffee for sale
  final List<Coffee> _shop = [
    // black 
    Coffee(name: "Long Black", price: "Rp. 180", imagePath: "images/black.png"),
    // latte
    Coffee(name: "Espresso", price: "Rp. 99", imagePath: "images/espresso.png"),

    // espresso
    Coffee(name: "Latte", price: "Rp. 199", imagePath: "images/latte.png"),

    // iced coffee
    Coffee(name: "Iced Coffee", price: "Rp. 140", imagePath: "images/iced_coffee.png")
  ];

  // user cart
  final List<Coffee> _userCart = [];

  // get coffee list
  List<Coffee> get coffeeShop => _shop;

  // get user cart
  List<Coffee> get userCart => _userCart;

  // add item to cart
  void addItemToCart(Coffee coffee){
    _userCart.add(coffee);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Coffee coffee){
    _userCart.remove(coffee);
    notifyListeners();
  }

}