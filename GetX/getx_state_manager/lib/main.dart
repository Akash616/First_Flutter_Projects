import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'main_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "quick",
        ),
        home: MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {

    var controller = Get.put(MainController());//put for first time initialization

    return Scaffold(
      appBar: AppBar(
        title: Text("GetX"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<MainController>(builder: (controller) {
              return "This is value ${controller.count}".text.xl3.semiBold.make();
            },),
            //Obx(() => "This is value ${controller.count.value}".text.xl3.semiBold.make(),),//velocity package

            ElevatedButton(
                onPressed: controller.increaseValue,
                child: "Increase Value".text.semiBold.make()
            )
          ],
        ),
      ),
    );
  }
}
