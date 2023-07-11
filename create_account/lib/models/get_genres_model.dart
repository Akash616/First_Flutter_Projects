// To parse this JSON data, do
//
//     final getGenresName = getGenresNameFromJson(jsonString);

import 'dart:convert';

GetGenresName getGenresNameFromJson(String str) => GetGenresName.fromJson(json.decode(str));

class GetGenresName {
  Data data;

  GetGenresName({
    required this.data,
  });

  factory GetGenresName.fromJson(Map<String, dynamic> json) => GetGenresName(
    data: Data.fromJson(json["data"]),
  );

}

class Data {
  List<Genre> genres;

  Data({
    required this.genres,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
  );
}

class Genre {
  String name;

  Genre({
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    name: json["name"],
  );
}
