import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_management_app/models/TTable.dart';

const String baseURL ="http://10.147.20.177:8080/tables";
class TableController{
  static Future<List<TTable>> getList() async {
    var url = Uri.parse(baseURL);
    final response = await http.get(url);
    final body = json.decode(response.body);
    return body.map<TTable>((jsonItem) => TTable.fromJson(jsonItem as Map<String, dynamic>)).toList();
  }


  static Future<TTable> getTable(String id)async{
    var url=Uri.parse(baseURL +"/"+ id);
    final response = await http.get(url);
    final bodyByte = utf8.decode(response.bodyBytes);
    final body  = json.decode(bodyByte);
    final table = TTable.fromJson(body);
    return table;
  }

  static Future<bool> addTable(
      String name,
      int size) async {
    final response = await http.post(
      Uri.parse(baseURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'size': size
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to create table.');
    }
  }

  static Future<bool> deleteTable(String id) async {
    var url=Uri.parse(baseURL+"/"+id);
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete table.');
    }
  }
}