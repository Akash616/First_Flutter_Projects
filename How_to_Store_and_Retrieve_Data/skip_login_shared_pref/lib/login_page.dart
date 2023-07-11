import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skip_login_shared_pref/main.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget{

  var uNameController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Login')),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffffecd2),//value- 0xff_______ or ox00______
              Color(0xfffcb69f),
              Color(0xffff9b7e)
            ]
          )
        ),
        child: Center(
          child: SizedBox(
            width: 250,
            child: Wrap(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(21.0),
                      child: Icon(Icons.account_circle, size: 100, color: Colors.deepOrange,),
                    ),
                    TextField(
                      controller: uNameController,
                      decoration: InputDecoration(

                          hintText: " Email or mobile number",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21)
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      controller: passController,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                          hintText: " Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21)
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: 100,
                      height: 50,
                      child: ElevatedButton(onPressed: () async{
                        //If Successfully Logged in (Credentials are Correct)

                        var sharedPref = await SharedPreferences.getInstance();
                        sharedPref.setBool(SplashPageState.KEYLOGIN, true);

                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                      }, child: Text('Login'),),
                    ),
                    SizedBox(height: 20,),
                    Text("Forgotten Password?",style: TextStyle(fontSize: 15)),
                    SizedBox(height: 50,),
                    SizedBox(
                        width: 400, child: OutlinedButton(onPressed: (){}, child: Text('Create new accounr'))
                    ),
                    SizedBox(height: 50,),
                    Text("*Akash Gupta", style: TextStyle(color: Colors.deepOrange),)
                  ],
                ),
              ],
            )
          ),
        ),
      ),
    );
  }

}