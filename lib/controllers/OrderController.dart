import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_management_app/models/Order.dart';
import 'package:restaurant_management_app/models/OrderLine.dart';


const String baseURL ="https://restaurantmanagement.blackrock-c5d925d6.northeurope.azurecontainerapps.io/orders";
class OrderController{
  static Future<List<Order>> getList() async {
    var url = Uri.parse(baseURL);
    final response = await http.get(url);
    final body = json.decode(response.body);
    return body.map<Order>((jsonItem) => Order.fromJson(jsonItem as Map<String, dynamic>)).toList();
  }


  static Future<Order> getOrder(String id)async{
    var url=Uri.parse(baseURL +"/"+ id);
    final response = await http.get(url);
    final bodyByte = utf8.decode(response.bodyBytes);
    final body  = json.decode(bodyByte);
    final order = Order.fromJson(body);
    return order;
  }

  static Future<bool> addOrder(
      String orderName,
      int table_id,
      int reservation_id,
      List<OrderLine> lines) async {
    final response = await http.post(
      Uri.parse(baseURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "name": orderName,
        "table_id": table_id,
        "reservation_id": reservation_id,
        "lines": lines.map((line) => {
          "position_id": line.position_id,
          "quantity": line.quantity
        }).toList(),
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to create order.');
    }
  }

  static Future<bool> deleteOrder(String id) async {
    var url=Uri.parse(baseURL+"/"+id);
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete order.');
    }
  }
}
