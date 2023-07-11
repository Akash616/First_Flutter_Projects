import 'package:flutter/material.dart';//android specific development - MaterialApp() for material design
import 'package:practice1/drawer.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'login_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Awesome app",
      theme: ThemeData(
          primarySwatch: Colors.purple
      ),
      home: LoginPage(),
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage()
      },
    );
  }

}

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _nameController = TextEditingController();
  var myText = "Change Me";

  var base = "https://jsonplaceholder.typicode.com";
  var data;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async{
    Uri url = Uri.parse("$base/photos");
    var res = await http.get(url);
    //print(res.body);
    data = jsonDecode(res.body);//de-serialized - jsonDecode() import 'dart:convert';
    print(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("App"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: data != null
            ? ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListTile(
                    title: Text(data[index]["title"]),
                    subtitle: Text("ID: ${data[index]["id"]}"), //${} string interpolation
                    leading: Image.network(data[index]["url"]),
                  ),
                );
              },
            )
            : Center(child: CircularProgressIndicator(),),
      ),

      drawer: MyDrawer(),

      //floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          myText = _nameController.text.toString();
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}