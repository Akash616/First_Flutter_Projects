import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'drawer.dart';

class MyHomePageSB extends StatelessWidget {

  Future getData() async{
    var base = "https://jsonplaceholder.typicode.com";
    Uri url = Uri.parse("$base/photos");
    var res = await http.get(url);
    //print(res.body);
    var data = jsonDecode(res.body);//de-serialized - jsonDecode() import 'dart:convert';
    //print(data);
    return data;
  }

  Stream<List<String>> getStreamData(){
    var data = Stream<List<String>>.fromIterable([
      List<String>.generate(20, (index) => "Item $index")
    ]);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Builder"),
      ),
      body: StreamBuilder(
        stream: getStreamData(),
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
                      title: Text(snapshot.data[index]),
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
