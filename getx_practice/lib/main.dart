import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/main_controller.dart';
import 'package:getx_practice/second_screen.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //GetMaterialApp- darkTheme: ,getPages: [], etc....
      // themeMode: ThemeMode.system,
      // darkTheme: ThemeData(),
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "quick",
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var count = 0;
    var controller = Get.put(MainController()); //first time initialized.
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*obs wala variable ko jaha bhi use kiya hai, usko update karwana ka leya
              Widget ko wrap kar denga - Obx() Observable widget ka sath.  */
            /* BENEFIT- yahi wala widget update hoga puri screen may say. */
            // Obx(() => "This is value: ${controller.count.value}"
            //     .text
            //     .xl3
            //     .semiBold
            //     .make()
            // ), //count.vale -> why? bec RxInt error
            GetBuilder<MainController>(builder: (controller) {
              return "This is value: ${controller.count}"
                  .text
                  .xl3
                  .semiBold
                  .make();
            }),
            ElevatedButton(
                // onPressed: () {
                //   controller.count++; //state update ni hogi bec. of statelessWidget
                //   print(controller.count);
                // },
                onPressed: controller.IncreaseValue,
                child: "Increase Value".text.semiBold.make()),
            ElevatedButton(
                onPressed: () {
                  //ak screen say dusari screen mai jana
                  Get.to(
                    () => SecondScreen(),
                    duration: Duration(seconds: 3),
                    transition: Transition.zoom
                  );
                },
                child: "Change Screen".text.semiBold.make()),
            ElevatedButton(
                onPressed: () {
                  Get.changeTheme(ThemeData.dark());
                },
                child: "Change Theme".text.semiBold.make()),
            ElevatedButton(
                onPressed: () {
                  Get.snackbar("Akash Gupta", "I'm from dehradun",
                      backgroundColor: Colors.amber, colorText: Colors.white);
                },
                child: "Show Snackbar".text.semiBold.make()),
            ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                      backgroundColor: Colors.amber,
                      title: "Akash Gupta from Dehradun",
                      textCancel: "NO",
                      textConfirm: "YES");
                },
                child: "Show Dialog".text.semiBold.make()),
          ],
        ),
      ),
    );
  }
}
