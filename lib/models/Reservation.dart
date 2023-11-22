import 'package:flutter/material.dart';
import 'package:restaurant_management_app/models/Client.dart';
import 'package:restaurant_management_app/models/TTable.dart';

class Reservation{
  int id;
  String ddate;
  String hhour;
  Client client;
  TTable table;
  int guestNum;
  String additionalRemarks;

  Reservation({
    required this.id,
    required this.ddate,
    required this.hhour,
    required this.client,
    required this.table,
    required this.guestNum,
    required this.additionalRemarks
  });
}
