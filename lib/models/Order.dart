import 'package:flutter/material.dart';
import 'package:restaurant_management_app/models/Reservation.dart';
import 'package:restaurant_management_app/models/TTable.dart';
import 'package:restaurant_management_app/models/OrderLine.dart';

class Order{
  int id;
  String name;
  TTable table;
  Reservation reservation;
  List<OrderLine> orderLines;

  Order({
    required this.id,
    required this.name,
    required this.table,
    required this.reservation,
    required this.orderLines
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    var list = json['orderLines'] as List;
    List<OrderLine> orderLineList = list.map((i) => OrderLine.fromJson(i)).toList();

    return Order(
      id: json['id'],
      name: json['name'],
      table: TTable.fromJson(json['table']),
      reservation: Reservation.fromJson(json['reservation']),
      orderLines: orderLineList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': this.name,
      'table': table.toJson(),
      'reservation': reservation.toJson(),
      'orderLines': orderLines.map((e) => e.toJson()).toList(),
    };
  }
}