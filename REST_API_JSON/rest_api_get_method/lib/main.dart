import 'package:flutter/material.dart';
import 'package:rest_api_get_method/models/posts_model.dart';
import 'package:rest_api_get_method/services/api_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REST API GET METHOD"),
      ),
      body: FutureBuilder(
        future: getPosts(),
        builder: (context, AsyncSnapshot snapshot) { //snapshot contain all data
          if(!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else{

            List<Product> product = snapshot.data;

            return ListView.builder(
              itemCount: product.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: ListTile(
                      leading: Image.network(product[index].thumbnail, width: 100,),
                      title: Text(product[index].title),
                      subtitle: Row(
                        children: [
                          Expanded(child: Text(product[index].description)),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(product[index].price.toString()),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      )
    );
  }
}
