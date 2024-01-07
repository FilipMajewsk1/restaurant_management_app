import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_management_app/models/Client.dart';

const String baseURL ="https://restaurantmanagement.blackrock-c5d925d6.northeurope.azurecontainerapps.io/clients";
class ClientController{
  static Future<List<Client>> getList() async {
    var url = Uri.parse(baseURL);
    final response = await http.get(url);
    final body = json.decode(response.body);
    return body.map<Client>((jsonItem) => Client.fromJson(jsonItem as Map<String, dynamic>)).toList();
  }

  static Future<Client> getClient(String id)async{
    var url=Uri.parse(baseURL +"/"+ id);
    final response = await http.get(url);
    final bodyByte = utf8.decode(response.bodyBytes);
    final body  = json.decode(bodyByte);
    final client = Client.fromJson(body);
    return client;
  }

  static Future<bool> addClient(
      String name,
      String surname,
      String email,
      String phoneNum) async {
    final response = await http.post(
      Uri.parse(baseURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'surname': surname,
        'email': email,
        'phoneNum': phoneNum
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to create Client.');
    }
  }

  static Future<bool> deleteClient(String id) async {
    var url=Uri.parse(baseURL+"/"+id);
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete Client.');
    }
  }
}