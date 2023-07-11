import 'dart:convert';

import 'package:http/http.dart' as http;

var base = "https://dummyjson.com/";

postData() async{
  Uri url = Uri.parse("$base/products/add");

  //these two things i'm send to server using object/map
  var data = { // object/map
    'title':"Harry Potter",
    'price': 300.toString(),//map may integer ko pass nahi kar sakta
  };

  // var headers = { //according to your server requirement
  //   'content-type': 'application/json'
  // };
  //for this api we don't need headers
  // var post = http.post(url, body: data, headers: headers);

  var post = await http.post(url, body: data);

  try{
    if(post.statusCode == 200){ //200 - hamari request successfully server ka pass chali gayi hai

      var jsonData = jsonDecode(post.body);
      print(jsonData);
      print("Data is uploaded successfully");

    }else{
      print("error during posting data");
    }
  }catch(e){
    print(e.toString());
  }

}