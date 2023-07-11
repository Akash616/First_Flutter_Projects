import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'drawer.dart';

class MyHomePageFB extends StatelessWidget {

  Future getData() async{
    var base = "https://jsonplaceholder.typicode.com";
    Uri url = Uri.parse("$base/photos");
    var res = await http.get(url);
    //print(res.body);
    var data = jsonDecode(res.body);//de-serialized - jsonDecode() import 'dart:convert';
    //print(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Future Builder"),
        ),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch(snapshot.connectionState){
            case ConnectionState.none:
                return Center(
                  child: Text("Fetch Something"),
                );
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if(snapshot.hasError){
                return Center(
                  child: Text("Some Error Occured"),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListTile(
                      title: Text(snapshot.data[index]["title"]),
                      subtitle: Text("ID: ${snapshot.data[index]["id"]}"), //${} string interpolation
                      leading: Image.network(snapshot.data[index]["url"]),
                    ),
                  );
                },
              );

          }
        },),
      drawer: MyDrawer(),
    );
  }
}
