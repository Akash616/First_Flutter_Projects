import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'main_controller.dart';
import 'second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      themeMode: ThemeMode.dark,
       darkTheme: ThemeData(appBarTheme: AppBarTheme(
           backgroundColor: Colors.purple,shadowColor: Colors.deepOrange,
         elevation: 50.0,shape: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
       )),

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
            ),
            ElevatedButton(
              onPressed: (){
                Get.off(() => SecondScreen(),
                    duration: Duration(seconds: 2),transition: Transition.leftToRight);
              }, child: "Change Screen".text.semiBold.make(),
            ),
            ElevatedButton(
                onPressed: (){
                  Get.changeTheme(ThemeData.dark());
                  //Get.changeTheme(Get.isDarkMode? ThemeData.light(): ThemeData.dark());
                }, child: "Change Theme".text.semiBold.make(),
            ),
            ElevatedButton(
                onPressed: (){
                  Get.snackbar("Akash Gupta", "I live in Dehradun.",
                      backgroundColor: Colors.amber,
                      colorText: Colors.white
                  );
                }, child: "Show Snack-bar".text.xl3.semiBold.make()
            ),
            ElevatedButton(
                onPressed: (){
                  Get.defaultDialog(
                      backgroundColor: Colors.amber,
                      title: "Akash Gupta",
                      textCancel: "NO",
                      textConfirm: "YES"
                  );
                }, child: "Show Dialog".text.xl3.semiBold.make()
            )
          ],
        ),
      ),
    );
  }
}
