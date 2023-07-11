import 'package:create_account/models/get_genres_model.dart';
import 'package:http/http.dart' as http;

var link = "https://apimocha.com/flutterassignment/getGenres";

getGenresNames() async{
  var res = await http.get(Uri.parse(link));
  if(res.statusCode == 200){
    var data = getGenresNameFromJson(res.body.toString());
    print("Data is received");
    return data;
  }
}