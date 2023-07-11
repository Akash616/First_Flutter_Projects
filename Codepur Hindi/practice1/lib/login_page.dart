import 'package:flutter/material.dart';
import 'package:practice1/bg_image.dart';

import 'main.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          BgImage(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Card(
                  child: Column(
                    children: [
                      Form(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Enter Username",
                                    labelText: "Username"
                                ),),
                              SizedBox(height: 20,),
                              TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "Enter Password",
                                    labelText: "Password"
                                ),)
                            ],
                          ),
                        ),),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(onPressed: (){
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => HomePage())
                          // );
                          Navigator.pushNamed(context, "/home");
                        }, child: Text("Sign in")),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}