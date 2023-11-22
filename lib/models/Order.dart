import 'package:flutter/material.dart';
import 'package:restaurant_management_app/models/Reservation.dart';
import 'package:restaurant_management_app/models/TTable.dart';
import 'package:restaurant_management_app/models/OrderLine.dart';

class Order{
  int id;
  TTable table;
  Reservation reservation;
  List<OrderLine> orderLines;

  Order({
    required this.id,
    required this.table,
    required this.reservation,
    required this.orderLines
  });
}