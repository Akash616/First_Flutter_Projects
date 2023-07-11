import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dependencies_manager/main_controller.dart';
import 'package:velocity_x/velocity_x.dart';

import 'main.dart';

class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    var controller = Get.find<MainController>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<MainController>(builder: (controller) {
              return "Your value was: ${controller.count}".text.xl3.semiBold.make();
            },),

            ElevatedButton(
                onPressed: (){
                  controller.count--;
                 // controller.refresh();
                  controller.update();
                }, child: "Decrease Value".text.semiBold.make(),
            ),
            ElevatedButton(
              onPressed: (){
                Get.off(()=> MyHomePage(),duration: Duration(seconds: 2),transition: Transition.downToUp);
              }, child: "Go Back".text.semiBold.make(),
            ),
          ],
        ),
      ),
    );
  }

}