import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  var arrIndex = [1,2,3,4,5,6,7,8,9,10,11,12];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('3D List - ListWheelScrollView'),
      ),
      body: Center(
        child: ListWheelScrollView(
          itemExtent: 200, //height of a single widget
          children: arrIndex.map((value) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container( //inside map function // there is anonymous function
              child: Center(child: Text('$value', style: TextStyle(fontSize: 21, color: Colors.white),)),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(21) //edges round
              ),
            ),
          )).toList(),//toList() --> convert into list
        ),
      ),
    );
  }

}





