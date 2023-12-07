import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_management_app/models/Menu.dart';

const String baseURL ="http://10.147.20.177:8080/menu";
class MenuController{
  static Future<List<Menu>> getList()async{
    var url=Uri.parse(baseURL);
    final response = await http.get(url);
    final bodyByte = utf8.decode(response.bodyBytes);
    final body  = json.decode(bodyByte);
    return body.map<Menu>(Menu.fromJson).toList();
  }

  static Future<Menu> getPosition(String id)async{
    var url=Uri.parse(baseURL + id);
    final response = await http.get(url);
    final bodyByte = utf8.decode(response.bodyBytes);
    final body  = json.decode(bodyByte);
    final position = Menu.fromJson(body);
    return position;
  }

  static Future<bool> addPosition(
      String dishName,
      String dishDescription,
      int price,
      String allergens,
      String section) async {
    final response = await http.post(
      Uri.parse(baseURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "dishName": dishName,
        "dishDescription": dishDescription,
        "price": price,
        "allergens": allergens,
        "section": section
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to create position.');
    }
  }

  static Future<bool> deletePosition(String id) async {
    var url=Uri.parse(baseURL+id);
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete position.');
    }
  }
}