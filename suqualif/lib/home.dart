import 'package:flutter/material.dart';
import 'package:suqualif/login.dart';
import 'package:suqualif/item.dart';

class HomePage extends StatelessWidget {
  String username;
  HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome, $username"),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Text("Dark Mode")
              ),
            ],
          ),
        ],
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
      body: SingleChildScrollView(
        child: 
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: const [
                Center(
                  child: 
                    Text("About Us", 
                    style: TextStyle(fontSize: 30.0 ,fontWeight:FontWeight.bold,color: Colors.black, ),
                    textAlign: TextAlign.center, )
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('''We welcome you to sit back, unwind and appreciate the lovely sights and hints of the ocean while our best gourmet expert sets you up a scrumptious dinner utilizing the best and freshest ingredients. 
                  
                  SU's legacy comes from The parent  Restaurant which was built up in 1963. Organization Name’ was worked for people in general and has advanced into a combination between exquisite chic and contemporary fine charge. Enjoy our dazzling dishes and make the most of your eating background with us!'''),
                ),
                Center(
                  child: 
                    Text("Service", 
                      style: TextStyle(fontSize: 20.0 ,fontWeight:FontWeight.bold,color: Colors.black, ),
                      textAlign: TextAlign.center, ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('''
                  The administration is right on the money and what you would anticipate from a foundation of this bore: amazingly proficient and educated, inquiries concerning fixings are handed-off to the cook and replied. The steady nearness of the director on the floor adds to the accomplishment of the eatery.'''),
                )
              ]
            ),
          ),
        )
    );
  }
}