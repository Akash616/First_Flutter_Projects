
//modal class
class Note { //this class represent your database table

  //these variables are the table columns name
  late int _id;
  late String _title;
  late String? _description;
  late String _date;
  late int _priority;

  //define constructor - will help us to create our Note object.
  Note(this._title, this._date, this._priority, [this._description]);// [this._description] make it optional

  Note.withId(this._id, this._title, this._date, this._priority, [this._description]);//it's a named constructor

  //getter and setter
  int get id => _id;
  String get title => _title;
  String? get description => _description;
  int get priority => _priority;
  String get date => _date;

  set title(String newTitle){
    if(newTitle.length <= 255){
      this._title = newTitle;
    }
  }

  set description(String? newDescription){
    if(newDescription != null && newDescription.length <= 255){
      this._description = newDescription;
    }
  }

  set priority(int newPriority){
    if(newPriority >=1 && newPriority<=2){
      this._priority = newPriority;
    }
  }

  set date(String newDate){
    this._date = newDate;
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() { //function

    //var map = new Map();
    var map = Map<String, dynamic>();// instantiated empty map object
    if(id != null){
      map['id'] = _id;
    }
    map['title'] = _title;//Map<String => 'title', dynamic => both int and string>
    map['description'] = _description;
    map['priority'] = _priority;
    map['date'] = _date;

    return map;
  }

  // Extract a Note object from a Map object
  Note.fromMapObject(Map<String, dynamic> map) { //Named Constructor
    _id = map['id'];
    _title = map['title'];
    _description = map['description'];
    _priority = map['priority'];
    _date = map['date'];
  }

}