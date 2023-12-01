import 'package:flutter/material.dart';
import 'package:restaurant_management_app/models/Client.dart';
import 'package:restaurant_management_app/models/TTable.dart';

class Reservation{
  int id;
  String name;
  String ddate;
  String hhour;
  Client client;
  TTable table;
  int guestNum;
  String additionalRemarks;

  Reservation({
    required this.id,
    required this.name,
    required this.ddate,
    required this.hhour,
    required this.client,
    required this.table,
    required this.guestNum,
    required this.additionalRemarks
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'],
      name: json['name'],
      ddate: json['ddate'],
      hhour: json['hhour'],
      client: Client.fromJson(json['client']),
      table: TTable.fromJson(json['table']),
      guestNum: json['guestNum'],
      additionalRemarks: json['additionalRemarks'],
    );
  }
}
