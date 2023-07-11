import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isFirst = true;

  // @override
  // void initState() {
  //   super.initState();
  //   // TODO: implement initState
  //   Timer(Duration(seconds: 4), (){
  //     reload();
  //   });
  // }
  //
  void reload(){
    setState(() {
      if(isFirst){
        isFirst = false;
      }else{
        isFirst = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foo Animation - AnimatedCrossFade'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(duration: Duration(seconds: 3),
              firstChild: Container(width: 200, height: 200, color: Colors.grey.shade400,),
              secondChild: Image.asset('assets/images/img.png', width: 100, height: 100,),
              //sizeCurve: Curves.fastOutSlowIn,
              firstCurve: Curves.easeInOut,
              secondCurve: Curves.bounceInOut,

              //crossFadeState: CrossFadeState.showSecond,
              crossFadeState: isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            ),
            ElevatedButton(onPressed: (){
              reload();
            }, child: Text('Show'))
          ],
        ),
      )
    );
  }
}
