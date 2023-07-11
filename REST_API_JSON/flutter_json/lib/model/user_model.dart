//flutter Model
import 'dart:convert';
class User{
  String? name; //?-nullable
  int? age;
  bool? married;
  dynamic kids;//"kids": null,
  List<dynamic>? hobbies;

  //variable initialisation - constructor
  User({this.name,this.age,this.married,this.kids,this.hobbies});

  //factory constructor
  factory User.fromJson(Map<String,dynamic> json) => User(
    name: json['name'],
    age: json['age'],
    married: json['married'],
    kids: json['kids'],
    hobbies: json['hobbies']
  );
}

User userFromJson(String str) => User.fromJson(jsonDecode(str));