import 'package:flutter/material.dart';

import 'model/user.dart';

class DetailPage extends StatelessWidget {
  String name;
  String desc;
  int price;
  String image;
  List<User> user;

  TextEditingController commentController = TextEditingController();

  DetailPage({super.key, required this.name, required this.desc, required this.price, required this.image, required this.user});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          title: Text(name),
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.food_bank_rounded),text: "Food Detail",),
            Tab(icon: Icon(Icons.comment), text: "Reviews",)
          ]),
        ),
        body: TabBarView(children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(name, 
                  style: const TextStyle(fontSize: 20.0 ,fontWeight:FontWeight.bold,color: Colors.black, ),
                  textAlign: TextAlign.center, ),
              ),
              Image.asset(image, width: 150, height: 80,),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Text(desc,
                  style: const TextStyle(fontSize: 15.0),
                  textAlign: TextAlign.center,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Text("Rp$price",
                  style: const TextStyle(fontSize: 15.0, fontWeight:FontWeight.bold, ),
                  textAlign: TextAlign.center,),
                ),
              ),
              TextField(
                controller: commentController,
                decoration: const InputDecoration(
                  hintText: "Input Comment"
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  String comment = commentController.text;

                  if(comment.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Comment cannot be empty!")));
                  }
                }, 
                child: const Text("Submit")
              )
            ]),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Expanded(child: ListView.builder(
                itemCount: user.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(user[index].username, 
                            style: const TextStyle(fontSize: 20.0 ,fontWeight:FontWeight.bold,color: Colors.black, ),),
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(user[index].comment,
                            style: const TextStyle(fontSize: 15.0, ),),
                        )
                      )
                    ],
                  );
                },
              ),)
            ]),
          ),
        ],)
      )
    );
  }
}