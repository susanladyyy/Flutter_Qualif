import 'package:flutter/material.dart';
import 'package:suqualif/detail.dart';
import 'package:suqualif/login.dart';
import 'package:suqualif/model/food.dart';
import 'package:suqualif/model/user.dart';

import 'home.dart';

class ItemPage extends StatelessWidget {

  String username;

  ItemPage({super.key, required this.username});

  var foods = [
    Food(name: "Bento", desc: "A Japanese-style packed lunch, a light meal that you take to eat at work or school.", image: "assets/foods/bento.webp", user: [User(username: "Lenny", comment: "The food was very good indeed"), User(username: "Luca", comment: "Neatly packed!")], price: 24000),
    Food(name: "Jar Cake", desc: "A sweet, baked, breadlike food, made with or without shortening, and usually containing flour, sugar, baking powder or soda, eggs, and liquid flavoring.", image: "assets/foods/jar_cake.webp", user: [User(username: "Lenny", comment: "The food was very good indeed"), User(username: "Luca", comment: "Neatly packed!")], price: 25000),
    Food(name: "Choco Cheesecake", desc: "A dessert consisting of a thick, creamy filling of cheese, eggs, and sugar over a thinner crust and topped with sweet or sometimes salty items.", image: "assets/foods/choco_cheese_cake.webp", user: [User(username: "Lenny", comment: "The food was very good indeed"), User(username: "Luca", comment: "Neatly packed!")], price: 26000),
    Food(name: "Lamb Chop", desc: "Bone-in meat chops, cut from the shoulder, loin, sirloin, or rib.", image: "assets/foods/lamb_chop.webp", user: [User(username: "Lenny", comment: "The food was very good indeed"), User(username: "Luca", comment: "Neatly packed!")], price: 310000),
    Food(name: "Pizza", desc: "A flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese, and many other ingredients, baked quickly.", image: "assets/foods/pizza.webp", user: [User(username: "Lenny", comment: "The food was very good indeed"), User(username: "Luca", comment: "Neatly packed!")], price: 120000),
    Food(name: "Roll Cake", desc: "A sponge cake-like dessert that is rolled with fillings.", image: "assets/foods/roll_cake.webp", user: [User(username: "Lenny", comment: "The food was very good indeed"), User(username: "Luca", comment: "Neatly packed!")], price: 80000),
    Food(name: "Salad", desc: "A mixture of raw usually green leafy vegetables combined with other vegetables", image: "assets/foods/salad.webp", user: [User(username: "Lenny", comment: "The food was very good indeed"), User(username: "Luca", comment: "Neatly packed!")], price: 55000),
    Food(name: "Signature Donut", desc: "A small cake of sweetened or, sometimes, unsweetened dough fried in deep fat, typically shaped like a ring or, when prepared with a filling.", image: "assets/foods/signature_donut.webp", user: [User(username: "Lenny", comment: "The food was very good indeed"), User(username: "Luca", comment: "Neatly packed!")], price: 15000),
    Food(name: "Sunny Side Up", desc: "Fried just on one side and never flipped. The yolk is still completely liquid and the whites on the surface are barely set.", image: "assets/foods/sunny_side_up.webp", user: [User(username: "Lenny", comment: "The food was very good indeed"), User(username: "Luca", comment: "Neatly packed!")], price: 45000),
    Food(name: "Tacos", desc: "A Mexican food that consists of a folded and usually fried piece of thin bread (called a tortilla) that is filled with meat, cheese, lettuce, etc.", image: "assets/foods/tacos.webp", user: [User(username: "Lenny", comment: "The food was very good indeed"), User(username: "Luca", comment: "Neatly packed!")], price: 36000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Welcome, $username")
      ),
      drawer: Drawer(
        child:
          ListView(
              children: [
                const DrawerHeader(
                  child: 
                    Text("Menu", style: TextStyle(fontSize: 30.0 ,fontWeight:FontWeight.bold,color: Colors.black)),
                ), 
                ListTile(
                  title: const Text("Home"),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context) {
                        return HomePage(username: username,);
                      }
                    ), (route) => false);
                  }
                ),
                ListTile(
                  title: const Text("Items"),onTap: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context) {
                        return ItemPage(username: username,);
                      }
                    ), (route) => false);
                  }
                ),
                ListTile(
                  title: const Text("Logout"),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context) {
                        return const LoginPage();
                      }
                    ), (route) => false);
                  }
                ),
              ]
          )
      ),
      body: Container(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: 
                Text("Food List", 
                style: TextStyle(fontSize: 30.0 ,fontWeight:FontWeight.bold,color: Colors.black, ),
                textAlign: TextAlign.center, )
            ),
          ),
          Expanded(child: 
            GridView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: foods.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return DetailPage(name: foods[index].name, desc: foods[index].desc, image: foods[index].image, price: foods[index].price, user: foods[index].user,);
                    },));
                  },
                  child: 
                  Column(children: [
                    Text(foods[index].name),
                    Image.asset(foods[index].image, width: 200, height: 150,)
                  ],),
                );
              }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 20, crossAxisSpacing: 20, crossAxisCount: 2),
            )
          )
        ]),
      ),
    );
  }
}