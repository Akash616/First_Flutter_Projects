import 'package:get/get.dart';

/*GetxController - MainController class ka anadar is GetxController ki sari
functionality ajaya gi.*/
/*Apna StatlessWidget ka states ko control karna ka leya huma controller
 ko create karna padaga.*/
class MainController extends GetxController{

  /* JO bhi variable/ya chij humko update karwani hai, humko uska sath
    listener ko add karna padaga.
    count variable -> observable variable ban jaya ga.
    matlab listener lag gaya hai, woh iski value ka dhayan rakha ga,
    ki abhi iski kya value hai.
   */
  // var count = 0.obs;
  //Error - RxInt -> reactive int

  var count = 0;
  IncreaseValue(){
    count++; //state update ni hogi bec. of statelessWidget
    refresh(); //GetBuilder<MainController>
    print(count);
  }
}