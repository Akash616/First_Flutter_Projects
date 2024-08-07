import 'package:flutter/material.dart';
import 'package:post_data_to_server/services/api_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){

          postData();

        },child: Icon(Icons.send),tooltip: "Tap"
      ),
      appBar: AppBar(
        title: Text("REST API POST METHOD"),
      ),
      body: Center(
        child: Text("HTTP POST() METHOD",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
      )
    );
  }
}
