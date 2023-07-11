import 'package:flutter/material.dart';
import 'package:notekeeper/screens/note_list.dart';
import 'package:notekeeper/utils/database_helper.dart';

import '../models/note.dart';

class NoteDetail extends StatefulWidget {
  final String appBarTitle;
  final Note note;

  NoteDetail(this.note, this.appBarTitle); //constructor

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(this.note, this.appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail> {
  static final _priorities = ['High', 'Low'];

  DatabaseHelper helper = DatabaseHelper();

  String appBarTitle;
  Note note;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  NoteDetailState(this.note, this.appBarTitle); //constructor

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //what go to execute when user press the back button of your device
      //for that we have HANDLER - onWillPop handler.
      onWillPop: () async{
        //Write some code to control things, when user press Back navigation button in device navigationBar
        //return false; //back button of android is Disabled.(stay on page)
        //return true; //back button of android is enabled by default is enabled.
        return false;
      },

      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
          leading: IconButton(
              onPressed: () {
                //Write some code to control thing, when user press back button in AppBar.
                moveToLastScreen(); //perform pop operation
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            //static data
            children: [
              ListTile(
                title: DropdownButton(
                    value: 'Low', //default value
                    items: _priorities.map((String dropDownStringItem) {
                      return DropdownMenuItem(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (valueSelectedByUser) {
                      setState(() {
                        debugPrint("User Selected $valueSelectedByUser");
                      });
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  controller: titleController,
                  style: TextStyle(),
                  onChanged: (value) {
                    debugPrint("Something changed in title Text field");
                  },
                  decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: TextStyle(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  controller: descriptionController,
                  style: TextStyle(),
                  onChanged: (value) {
                    debugPrint("Something changed in description Text field");
                  },
                  decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: TextStyle(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Row(
                  children: [
                    //raised button wrap with expanded widget so that they acquire EQUAL space
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            debugPrint("Save button clicked");
                          });
                        },
                        child: Text(
                          "Save",
                          textScaleFactor: 1.5,
                        ),
                        style: ButtonStyle(),
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            debugPrint("Delete button clicked");
                          });
                        },
                        child: Text(
                          "Delete",
                          textScaleFactor: 1.5,
                        ),
                        style: ButtonStyle(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context);
  }

}
