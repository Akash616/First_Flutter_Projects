import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skip_login_shared_pref/main.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Home')),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home, color: Colors.white.withOpacity(1), size: 100),
              SizedBox(height: 11,),
              ElevatedButton(onPressed: () async{

                var sharedPref = await SharedPreferences.getInstance();
                sharedPref.setBool(SplashPageState.KEYLOGIN, false);

                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));

              }, child: Text("Log Out"))
            ],
          ),
        ),
      ),
    );
  }

}