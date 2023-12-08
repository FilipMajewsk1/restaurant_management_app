import 'package:restaurant_management_app/models/OrderLine.dart';

class Order {
  int? id;
  String name;
  int table_id;
  int reservation_id;
  List<OrderLine> lines;

  Order({
    this.id,
    required this.name,
    required this.table_id,
    required this.reservation_id,
    required this.lines});

  factory Order.fromJson(Map<String, dynamic> json) {
    var list = json['lines'] as List;
    List<OrderLine> linesList = list.map((i) => OrderLine.fromJson(i)).toList();

    return Order(
      id: json['id'],
      name: json['name'],
      table_id: json['table_id'],
      reservation_id: json['reservation_id'],
      lines: linesList,
    );
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (id != null) {
      data['id'] = this.id;
    }
    data['name'] = this.name;
    data['table_id'] = this.table_id;
    data['reservation_id'] = this.reservation_id;
    data['lines'] = this.lines.map((v) => v.toJson()).toList();
    return data;
  }
}