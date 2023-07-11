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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

   late Animation _animation; //_private variable
   late AnimationController _animationController;

  var listRadius = [150.0, 200.0, 250.0, 300.0, 350.0];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 4), /*lowerBound: 0.5*/);
    //_animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    //by default animation controller mai 0 say 1 ka beach ki values milagi

    _animationController.addListener(() {
      setState(() {});
    });

    //start the animation
    //_animationController.forward(); //button ka onPressed pa bhi laga sakta hai
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ripple Animation with Icon'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            buildMyContainer(listRadius[0]),
            buildMyContainer(listRadius[1]),
            buildMyContainer(listRadius[2]),
            buildMyContainer(listRadius[3]),
            buildMyContainer(listRadius[4]),
            Icon(Icons.add_a_photo_outlined,color: Colors.white, size: 35),

            ElevatedButton(onPressed: (){
              _animationController.forward();

            }, child: Text('Click here'))
          ],
      )
      )
    );
  }

  //function
  Widget buildMyContainer(radius){
    return Container(
      width: radius*_animationController.value,
      height: radius*_animationController.value,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue.withOpacity(1.0 - _animationController.value),
      ),
    );
  }

}