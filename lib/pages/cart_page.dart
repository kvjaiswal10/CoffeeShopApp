

import 'package:coffee_shop_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/coffee_tile.dart';
import '../models/coffee.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  // remove coffee from cart
  void removeFromCart(Coffee coffee){
      
      // removing item
      Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
      // let the user know
      showDialog(context: context, builder: (context) => const AlertDialog(title: Text("Item removed from cart")));
  }

  // pay button
  void payNow(){
    /*
    fill out payment services
    */
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(builder:(context, value, child) => 
    SafeArea(
      child: Column(
        children: [
          const Text("Your Cart", style: TextStyle(fontSize: 20),),
          Expanded(
            child: ListView.builder(
            itemCount: value.userCart.length,
            itemBuilder: (context, index){
            Coffee eachCoffee = value.userCart[index];
            
            return CoffeeTile(
              coffee: eachCoffee,
             onPressed: () => removeFromCart(eachCoffee), icon: const Icon(Icons.delete),
             );
          }),
          ),

          // pay button
          GestureDetector(
            onTap: payNow,
            child: Container(
              padding: const EdgeInsets.all(40),
              width: double.maxFinite,
              decoration: BoxDecoration(color: Colors.brown, borderRadius: BorderRadius.circular(12)),
              child: const Center(child: Text("Pay Now", style: TextStyle(color: Colors.white),)),
              ),
          )
        ],
      )
    )
    );
  }

}

//(child: ListView.builder(itemBuilder: (context, index)
//Coffee eachCoffee = value.userCart[index];
//return CoffeeTile(coffee: eachCoffee, onPressed: () => removeFromCart(eachCoffee), icon: const Icon(Icons.delete));