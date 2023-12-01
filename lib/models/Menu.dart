import 'package:flutter/material.dart';

class Menu {
  int id;
  String dishName;
  String dishDescription;
  int price;
  String allergens;

  Menu({
    required this.id,
    required this.dishName,
    required this.dishDescription,
    required this.price,
    required this.allergens
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      id: json['id'],
      dishName: json['dishName'],
      dishDescription: json['dishDescription'],
      price: json['price'],
      allergens: json['allergens'],
    );
  }
}