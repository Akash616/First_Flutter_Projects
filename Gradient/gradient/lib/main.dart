import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Gradient',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gradient - RadialGradient"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient( //starting point center
            colors: [
              // Colors.orange,
              // Colors.purple,
              Color(0xffffecd2),//value- 0xff_______ or ox00______
              Color(0xffff5424)
            ],

            //center: Alignment.bottomCenter,
              center: Alignment.topCenter,//manymore

            stops: [0.0,1.0]//kitna gradient apko rakhna hai
          )
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(21.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Weight(in KGs)',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(
                        width: 2
                      )
                    )
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Height(in feet)',
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Height(in Inch)'
                  ),
                ),
                SizedBox(height: 50,),
                ElevatedButton(onPressed: (){}, child: Text('Click here'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}