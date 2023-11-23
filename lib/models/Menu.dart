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
}