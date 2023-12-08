import 'package:flutter/material.dart';
import 'package:restaurant_management_app/models/Client.dart';
import 'package:restaurant_management_app/models/TTable.dart';

class Reservation{
  int id;
  String name;
  String ddate;
  String hhour;
  int client_id;
  int table_id;
  int guestNum;
  String additionalRemarks;

  Reservation({
    required this.id,
    required this.name,
    required this.ddate,
    required this.hhour,
    required this.client_id,
    required this.table_id,
    required this.guestNum,
    required this.additionalRemarks
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
        id: json['id'],
        name: json['name'],
        ddate: json['ddate'],
        hhour: json['hhour'],
        client_id: json['client_id'],
        table_id: json['table_id'],
        guestNum: json['guestNumber'],
        additionalRemarks: json['additionalRemarks']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'ddate': ddate,
      'hhour': hhour,
      'client': client_id,
      'table': table_id,
      'guestNum': guestNum,
      'additionalRemarks': additionalRemarks,
    };
  }
}
