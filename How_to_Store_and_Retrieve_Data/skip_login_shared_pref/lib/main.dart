import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'login_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {

  static const String KEYLOGIN = "Login";

  @override
  void initState() {
    super.initState();

    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.ac_unit_sharp,size: 100, color: Colors.white,),
              Text('Splash Screen',style: TextStyle(color: Colors.white, fontSize: 25,)),
              SizedBox(height: 11,),
              Text("Developed By Akash Gupta", style: TextStyle(fontSize: 21,color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }

  void whereToGo() async {

    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(KEYLOGIN);

    //splash screen timer
    Timer(Duration(seconds: 3), () {

      if(isLoggedIn != null){ //either true or false
        if(isLoggedIn){ //true means user already logged in
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
        }else{ //false means user not logged in
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
        }
      } else{ //for first time
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
      }

    });

  }

}
