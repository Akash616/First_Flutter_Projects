import 'package:flutter/material.dart';
import 'package:local_database/services/db_helper.dart';

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("local database SQLite / SQFlite"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () async{
              await DatabaseHelper.instance.insertRecord(
                {
                  DatabaseHelper.columnName: "Laxman"
                }
              );
            }, child: Text("Insert")),

            ElevatedButton(onPressed: () async{
              var dbquery = await DatabaseHelper.instance.queryDatabase();
              print(dbquery);
            }, child: Text("Read")),

            ElevatedButton(onPressed: () async{
              await DatabaseHelper.instance.updateRecord(
                  {
                    DatabaseHelper.columnId: 2,
                    DatabaseHelper.columnName: "Ram"
                  }
              );
            }, child: Text("Update")),

            ElevatedButton(onPressed: () async{
              await DatabaseHelper.instance.deleteRecord(4);
            }, child: Text("Delete"))
          ],
        ),
      ),
    );
  }
}