import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nameController = TextEditingController();

  static const String KEYNAME = "name";
  var nameValue = "";

  @override
  void initState() { //init state can't handle async
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Pref"),
      ),
      body: Container(
        child: Center(
          child: SizedBox(
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    label: Text("Name"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21)
                    )
                  ),
                ),
                SizedBox(height: 11,),
                ElevatedButton(onPressed: () async {

                  var name = nameController.text.toString();
                  //print(name);

                  //initialisation shared_preferences
                  final prefs = await SharedPreferences.getInstance();
                  //save an string value to 'name' key
                  prefs.setString(KEYNAME, name); //key value pair

                }, child: Text("Save")),
                SizedBox(height: 11,),
                Text(nameValue)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getValue() async{
    final prefs = await SharedPreferences.getInstance();
    //read data
    var getName = prefs.getString(KEYNAME); //key

    nameValue = getName !=null ? getName : "No Value Saved";

    setState(() {
    });
  }

}




