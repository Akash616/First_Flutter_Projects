import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }

}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  //late - keyword, for late initilisation
  late Animation animation; //variable
  late Animation colorAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(vsync: this, duration: Duration(seconds: 5));

    //animation ki form mai lana ka leya .animate
    animation = Tween(begin: 0.0, end: 200.0).animate(animationController);

    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.orange).animate(animationController);

    animationController.addListener(() {
      print(animation.value);

      //UI mai reflect karwana ka leya
      setState(() {});

    });

    // to start animationController
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tween Animation'),
      ),
      body: Center(
        child: Container(
          width: animation.value,
          height: animation.value,
          color: colorAnimation.value,
        ),
      ),
    );
  }

}