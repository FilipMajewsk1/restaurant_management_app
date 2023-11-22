import 'package:flutter/material.dart';
import 'package:restaurant_management_app/models/Menu.dart';
import 'package:restaurant_management_app/models/Order.dart';

class OrderLine{
  int id;
  Order order;
  Menu position;
  int quantity;

  OrderLine({
  required this.id,
  required this.order,
  required this.position,
  required this.quantity
  });
}