import 'package:http/http.dart' as http;
import 'package:rest_api_get_method/models/posts_model.dart';

var base = "https://dummyjson.com";

getPosts() async{
  
  Uri url = Uri.parse("$base/products");
  var res = await http.get(url);

  try
  {
    if(res.statusCode == 200){ //200 - hamari request successfully server ka pass chali gayi hai

      //var data = res.body;//body- Data server say aya usko store karwana
      var data = poataModelFromJson(res.body);
      return data.products;

    }else{
      print("Error during connection");
    }
  }
  catch(e){
    print(e.toString());
  }

}