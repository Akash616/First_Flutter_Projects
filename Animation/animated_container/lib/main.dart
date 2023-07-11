import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Flutter Animation',
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
       primarySwatch: Colors.blue
     ),
     home: MyHomePage(),
   );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  var _width = 200.0; //private field
  var _height = 100.0; //private field

  bool flag = true; //for toogling

  Decoration myDecor = BoxDecoration( //global
    borderRadius: BorderRadius.circular(2),
    color: Colors.blueGrey,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foo Animations - AnimatedContainer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
                width: _width,
                height: _height,
                decoration: myDecor,

                curve: Curves.bounceInOut,//rate of change of animation

                duration: Duration(seconds: 2)
            ),
            ElevatedButton(onPressed: (){
              setState(() { //anonymous function
                //setState - runtime reflection
                //runtime update apna UI mai
                //setState rebuild Widget build(BuildContext context)
                if(flag) {
                  _width = 100.0;
                  _height = 200.0;
                  myDecor = BoxDecoration(
                    borderRadius: BorderRadius.circular(51),
                    color: Colors.orange
                  );
                  flag = false;
                }else{
                  _width = 200.0;
                  _height = 100.0;
                  myDecor = BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color:  Colors.blueGrey
                  );
                  flag = true;
                }
              });
            }, child: Text('Animate'))
          ]
        ),
      )
    );
  }

}