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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clippers - ClipRRect'),
      ),
      body: Center(
        child: ClipRRect(
          //borderRadius: BorderRadius.circular(21),
          //borderRadius: BorderRadius.all(Radius.circular(21)),
          //borderRadius: BorderRadius.all(Radius.elliptical(21, 71)),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(71), bottomRight: Radius.circular(21)),
          //child: Container(width: 200,height: 200, color: Colors.grey,),
          child: Image.asset('assets/images/img.jpg', width: 400, height: 200, fit: BoxFit.fill,),
        ),
      ),
    );
  }
}

