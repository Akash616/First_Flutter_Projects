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
      debugShowCheckedModeBanner: false,
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
  var myOpacity = 1.0; //global variable
  bool flag = true; //toogle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foo Animation - AnimatedOpacity'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(opacity: myOpacity, duration: Duration(seconds: 4), curve: Curves.elasticOut,
              child: Container(
                width: 200,
                height: 100,
                color: Colors.yellow,
              ),
            ),
            ElevatedButton(onPressed: (){
              setState(() {//rebuild
                if(flag){
                  myOpacity = 0.0; //invisible
                  flag = false;
                }else{
                  myOpacity = 1.0; //visible
                  flag = true;
                }
              });
            }, child: Text('Close'))
          ],
        ),
      )
      );
  }
}
