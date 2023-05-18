

import 'package:coffee_shop_app/components/coffee_tile.dart';
import 'package:coffee_shop_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/coffee.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {


  // add coffee to cart
  void addToCart(Coffee coffee){

      // add to cart
      Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

      // let the user know
      showDialog(context: context, builder: (context) => const AlertDialog(title: Text("Item added to cart")));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(builder: (context, value, child) => 
    SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 0, 5),
          child: Text("How would you like your coffee?", style: TextStyle(fontSize: 20),),
        ),
        const SizedBox(height: 25,),

        Expanded(
  
          child: ListView.builder(
            itemCount:  value.coffeeShop.length,
            itemBuilder: (context, index){
          // get coffee
          Coffee eachCoffee = value.coffeeShop[index];

          //return tile for this coffee
          return CoffeeTile(coffee: eachCoffee, icon: const Icon(Icons.add),
          onPressed: ()=> addToCart(eachCoffee) ,);
        }))
      ],),
    )
    );
  }
}