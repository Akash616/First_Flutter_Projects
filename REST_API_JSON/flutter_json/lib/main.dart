import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'model/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'REST API JSON',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late User data;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    readLocalJson();
  }

  void readLocalJson() async {
    isLoading = true;
    var d = await rootBundle.loadString("assets/json.json");
    data = userFromJson(d.toString());
    //print(data.name);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOCAL JSON"),
      ),
      body: Center(
        child: isLoading ? Center(child: CircularProgressIndicator(),) : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data.name.toString()),
            Text(data.age.toString()),
            Text(data.married.toString()),
            Text(data.kids.toString()),
            Row(
              // children: [
              //   Text(data.hobbies![0].toString()),
              //   Text(data.hobbies![1].toString()),
              // ],//same response
              children: List.generate(data.hobbies!.length, (index) {
                return Text(data.hobbies![index].toString());
              }).toList(),
            )
          ],
        ),
      ),
    );
  }

}
