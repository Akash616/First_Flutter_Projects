import 'package:get/get.dart';

class MainController extends GetxController{//change state - use controller
  //var count = 0.obs;//listener- observable variable
  //RxInt - reactive int
  var count = 0;
  increaseValue(){
    count++;
    refresh(); //2nd way to change state using GetBuilder
    print(count);
  }

}