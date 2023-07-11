import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:notekeeper/models/note.dart';

class DatabaseHelper {

  //A singleton object means that this instance(_databaseHelper) will be initialized only once throughout the application
  //that is throughout the life cycle of our application.
  static late DatabaseHelper _databaseHelper; //singleton DatabaseHelper
  static late Database _database; //Singleton Database

  String noteTable = "note_table";
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';

  DatabaseHelper._createInstance(); //Named Constructor to create instance of Databasehelper

  factory DatabaseHelper(){ //factory constructor - allow you to return some value
    if(_databaseHelper == null){
      _databaseHelper = DatabaseHelper._createInstance(); //This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if(_database == null){
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async{//FUNCTION - to initialize our database
    // Get the directory path for both Android and ios to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    // Define the path to our database
    String path = directory.path + "notes.db";//"${directory.path}notes.db";

    //Open/Create the database at a given path
    var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async { //function - to create our database
    await db.execute("CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colTitle TEXT,$colDescription TEXT, "
        "$colPriority INTEGER, $colDate TEXT)");
  }

  //Fetch Operation: Get all Note object from database
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database; //get the reference to the database

    // var result = await db.rawQuery("SELECT * FROM $noteTable order by $colPriority ASC");
    var result = await db.query(noteTable, orderBy: '$colPriority ASc');
    return result;
  }

  //Insert Operation: Insert a Note object to database
  Future<int> insertNote(Note note) async {
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap()); //toMap() - converting into map object
    return result;
  }

  //Update Operation: Update a Note object and save it to database
  Future<int> updateNote(Note note) async{
    Database db = await this.database;
    var result = await db.update(noteTable, note.toMap(), where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }

  //Delete Operation: Delete a Note object from database
  Future<int> deleteNote(int id) async {
    var db = await this.database;
    int result = await db.rawDelete("DELETE FROM $noteTable WHERE $colId = $id");
    return result;
  }

  //Get number of Note objects in database
  Future<int?> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery("SELECT COUNT(*) FROM $noteTable");
    var result = Sqflite.firstIntValue(x);
    return result;
  }

  //Get the 'Map List'[List<Map>] and convert it to 'Note List'[List<Note>]
  Future<List<Note>> getNoteList() async {
    var noteMapList =  await getNoteMapList(); //Get 'Map list' from database
    int count = noteMapList.length; //Count the no. of map entries in db table

    List<Note> noteList = <Note>[];
    //for loop to create a 'Note list' from a 'Map List'
    for(int i=0; i<count; i++){
      noteList.add(Note.fromMapObject(noteMapList[i]));
    }

    return noteList;
  }

}