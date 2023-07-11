import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  //list with dummy data
  var arrData = [
    { //map
        'name' : 'Ram',
        'mobno' : '8077142867',
        'unread' : '2'
    },
    {
      'name' : 'Shiva',
      'mobno' : '8077142867',
      'unread' : '1'
    },
    {
      'name' : 'Radha',
      'mobno' : '8077142867',
      'unread' : '3'
    },
    {
      'name' : 'Ganesh',
      'mobno' : '8077142867',
      'unread' : '1'
    },
    {
      'name' : 'Ram',
      'mobno' : '8077142867',
      'unread' : '2'
    },
    {
      'name' : 'Shiva',
      'mobno' : '8077142867',
      'unread' : '1'
    },
    {
      'name' : 'Radha',
      'mobno' : '8077142867',
      'unread' : '3'
    },
    {
      'name' : 'Ganesh',
      'mobno' : '8077142867',
      'unread' : '1'
    },
  ];//In dart - []list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MappingLists - map function'),
      ),
      body: Container(
        child: ListView(
          //children: [], when use, different index pai different widget chahiya means different design.

          //list ko map kar sakta hu in widget ka anadar
          //design same hai
          children: arrData.map((value) =>
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(value['name'].toString()),
              subtitle: Text(value['mobno'].toString()),
              trailing: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.purple,
                  child: Text(value['unread'].toString())),
            )
          ).toList()

        ),
      ),
    );
  }
}