import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/main_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ak baar controller initialise ho jaya Get.put(MainController()), toh hum
    // usko asani say kisi bhi screen ya widget ka andar get kar sakta hai.
    var controller = Get.find<MainController>(); //<type> which controller
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<MainController>(
              builder: (context) {
                return "Your value was: ${controller.count}".text.xl3.semiBold.make();
              }
            ),
            ElevatedButton(onPressed: (){
              controller.count--;
              // controller.refresh();
              controller.update();
            }, child: "Decrease Value".text.semiBold.make())
          ],
        ),
      ),
    );
  }
}
