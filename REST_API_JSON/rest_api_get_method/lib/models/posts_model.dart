// To parse this JSON data, do
//
//     final poataModel = poataModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PoataModel poataModelFromJson(String str) => PoataModel.fromJson(json.decode(str));

class PoataModel {
  PoataModel({
    required this.products,
  });

  List<Product> products;

  factory PoataModel.fromJson(Map<String, dynamic> json) => PoataModel(
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

}

class Product {
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  int id;
  String title;
  String description;
  int price;
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    discountPercentage: json["discountPercentage"].toDouble(),
    rating: json["rating"].toDouble(),
    stock: json["stock"],
    brand: json["brand"],
    category: json["category"],
    thumbnail: json["thumbnail"],
    images: List<String>.from(json["images"].map((x) => x)),
  );

}
