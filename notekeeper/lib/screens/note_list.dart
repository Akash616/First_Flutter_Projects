import 'package:flutter/material.dart';
import 'package:notekeeper/screens/note_detail.dart';
import 'package:notekeeper/utils/database_helper.dart';
import 'package:sqflite/sqlite_api.dart';

import '../models/note.dart';

class NoteList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {

  DatabaseHelper databaseHelper = DatabaseHelper();
  late List<Note> noteList;
  int count = 0;

  @override
  Widget build(BuildContext context) {

    if(noteList == null){
      noteList = <Note>[];
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("FAB clicked");
          navigateToDetail(Note('', '', 2), "Add Note");
        },
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getNoteListView() {
    //function that return list
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: getPriorityColor(this.noteList[index].priority),
              child: getPriorityIcon(this.noteList[index].priority),
            ),
            title: Text(this.noteList[index].title),
            subtitle: Text(this.noteList[index].date),
            trailing: GestureDetector(
              child: Icon(
                Icons.delete,
                color: Colors.grey,
              ),
              onTap: () {
                _delete(context, noteList[index]);
              },
            ),

            //click on these items, we have to navigate to our next screen.
            //onTap Event Handler.
            onTap: () {
              debugPrint("ListTile Tapped");
              navigateToDetail(this.noteList[index], "Edit Note");
            },
          ),
        );
      },
    );
  }

  //Returns the priority color
  Color getPriorityColor(int priority){
    switch(priority){
      case 1: return Colors.red;
              break;
      case 2: return Colors.yellow;
              break;
      default: return Colors.yellow;
    }
  }

  //Returns the priority icon
  Icon getPriorityIcon(int priority){
    switch(priority){
      case 1: return Icon(Icons.play_arrow);
              break;
      case 2: return Icon(Icons.keyboard_arrow_right);
              break;
      default: return Icon(Icons.keyboard_arrow_right);
    }
  }

  //Delete note
  void _delete(BuildContext context, Note note) async {
    int result = await databaseHelper.deleteNote(note.id);
    _showSnackBar(context, 'Note Deleted Successfully');
    updateListView();
  }
  //snackbar func.
  void _showSnackBar(BuildContext context, String message){
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Note note, String title) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetail(note, title);
    }));
  }

  void updateListView(){
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
}
