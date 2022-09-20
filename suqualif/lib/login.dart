import 'package:flutter/material.dart';
import 'package:suqualif/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // List<User> users = ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SU Qualif"),
      ),
      body: SingleChildScrollView(
        child: 
        Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Login Page", 
              style: TextStyle(fontSize: 30.0 ,fontWeight:FontWeight.bold,color: Colors.black)),
            ),
            Image.asset('assets/logo.png',
            height: 200,
            width: 200,),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                hintText: "Username"
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: "Password"
              ),
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  String username = usernameController.text;
                  String password = passwordController.text;
                  RegExp pattern = RegExp(r'^[a-zA-Z0-9_]*$');

                  if(username.length < 3 || username.length > 10) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Username length must be between 3 - 10 characters!")));
                  }
                  else if(username.contains(RegExp(r'[A-Z]'))) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Username should be in lowercase letters!")));
                  }
                  else if(password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Password cannot be empty!")));
                  }
                  else if(pattern.hasMatch(password) == false) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Password must not contain any special characters!")));
                  }
                  else {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context) {
                        return HomePage(username: usernameController.text,);
                      }
                    ), (route) => false);
                  }
                }, 
                child: const Text("Login")
              ),
            )
          ]),
        ),
      )
    ); 
  }
}