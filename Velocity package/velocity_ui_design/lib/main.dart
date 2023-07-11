import 'dart:async';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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

class MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(

              children: [

                //normal
                GestureDetector(
                  onTap: (){
                    VxDialog.showAlert(context,content: Container(),confirm: "OK",
                        title: "Alert Dialog",barrierDismissible: false);
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Vx.purple600,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    width: 200,
                    height: 200,
                    alignment: Alignment.center,
                    child: Text("Normal Widget",style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: "quick_bold"
                    ),),
                  ),
                ),//GestureDetector().onTap(() {print("normal");} it can also use with normal widget

                //VelocityX allows you to quickly create a Container using .box() extension or VxBox() widget.
                //VxBox().size(200, 200).color(Colors.orange).roundedSM.make()
                "Velocity Widget".text.white.size(25).fontFamily("quick_bold").makeCentered()
                    .box.margin(EdgeInsets.all(12)).padding(Vx.m64).size(200, 200)
                    .color(Colors.orange).roundedSM.make().onTap(() {
                      //context.showToast(msg: "Velocity Widget");
                      // VxToast.show(context, msg: "Velocity",bgColor: Colors.black,
                      //     textColor: Colors.white,textSize: 22, position: VxToastPosition.top);
                       VxToast.show(context, msg: "Screen Height- ${context.screenHeight}",textColor: Colors.white,
                       bgColor: Colors.black);
                    }),

                //Auto Play
                VxSwiper(
                    enlargeCenterPage: true, //another box is smaller
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 2),
                    items: [1,2,3,4,5].map((index) {
                      return "Item $index".text.white.make()
                          .box.rounded.alignCenter.color(Vx.randomOpaqueColor).make()
                          .p4();
                    }).toList()),

                //ROW()
                HStack([
                  "Velocity Widget".text.white.size(25).fontFamily("quick_bold").makeCentered()
                      .box.margin(EdgeInsets.all(12)).padding(Vx.m64).size(200, 200)
                      .color(Colors.orange).roundedSM.make().onTap(() {
                    //context.showToast(msg: "Velocity Widget");
                    VxToast.show(context, msg: "Velocity",bgColor: Colors.black,
                        textColor: Colors.white,textSize: 22, position: VxToastPosition.top);
                  }),
                  "Velocity Widget".text.white.size(25).fontFamily("quick_bold").makeCentered()
                      .box.margin(EdgeInsets.all(12)).padding(Vx.m64).size(200, 200)
                      .color(Colors.orange).roundedSM.make().onTap(() {
                    //context.showToast(msg: "Velocity Widget");
                    VxToast.show(context, msg: "Velocity",bgColor: Colors.black,
                        textColor: Colors.white,textSize: 22, position: VxToastPosition.center);
                  }),
                  "Velocity Widget".text.white.size(25).fontFamily("quick_bold").makeCentered()
                      .box.margin(EdgeInsets.all(12)).padding(Vx.m64).size(200, 200)
                      .color(Colors.orange).roundedSM.make().onTap(() {
                    //context.showToast(msg: "Velocity Widget");
                    VxToast.show(context, msg: "Velocity",bgColor: Colors.black,
                        textColor: Colors.white,textSize: 22, position: VxToastPosition.bottom);
                  }),
                ],).scrollHorizontal().p20(),

                //rating
                VxRating(
                  onRatingUpdate: (value) {},
                  count: 5,
                  selectionColor: Colors.red,
                  normalColor: Colors.black,
                  size: 40,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

