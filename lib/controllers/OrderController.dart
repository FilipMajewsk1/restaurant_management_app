import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_management_app/models/Order.dart';
import 'package:restaurant_management_app/models/OrderLine.dart';


const String baseURL ="http://10.147.20.177:8080/orders";
class OrderController{
  static Future<List<Order>> getList()async{
    var url=Uri.parse(baseURL);
    final response = await http.get(url);
    final bodyByte = utf8.decode(response.bodyBytes);
    final body  = json.decode(bodyByte);
    return body.map<Order>(Order.fromJson).toList();
  }

  static Future<Order> getOrder(String id)async{
    var url=Uri.parse(baseURL + id);
    final response = await http.get(url);
    final bodyByte = utf8.decode(response.bodyBytes);
    final body  = json.decode(bodyByte);
    final order = Order.fromJson(body);
    return order;
  }

  static Future<bool> addOrder(
      String orderName,
      int tableId,
      int reservationId,
      List<OrderLine> lines) async {
    final response = await http.post(
      Uri.parse(baseURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "orderName": orderName,
        "tableId": tableId,
        "reservationId": reservationId,
        "lines": lines.map((line) => {
          "position_id": line.position.id,
          "quantity": line.quantity
        })
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to create order.');
    }
  }

  static Future<bool> deleteOrder(String id) async {
    var url=Uri.parse(baseURL+id);
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete order.');
    }
  }
}
