import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_management_app/models/Reservation.dart';

const String baseURL ="https://restaurantmanagement.blackrock-c5d925d6.northeurope.azurecontainerapps.io/reservations";
class ReservationController{
  static Future<List<Reservation>> getList() async {
    var url = Uri.parse(baseURL);
    final response = await http.get(url);
    final body = json.decode(response.body);
    return body.map<Reservation>((jsonItem) => Reservation.fromJson(jsonItem as Map<String, dynamic>)).toList();
  }



  static Future<Reservation> getReservation(String id)async{
    var url=Uri.parse(baseURL +"/"+ id);
    final response = await http.get(url);
    final bodyByte = utf8.decode(response.bodyBytes);
    final body  = json.decode(bodyByte);
    final reservation = Reservation.fromJson(body);
    return reservation;
  }

  static Future<bool> addReservation(
      String name,
      String ddate,
      String hhour,
      int clientId,
      int tableId,
      int guestNum,
      String additionalRemarks) async {
    final response = await http.post(
      Uri.parse(baseURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "name": name,
        "ddate": ddate,
        "hhour": hhour,
        "client_id": clientId,
        "table_id": tableId,
        "guestNumber": guestNum,
        "additionalRemarks": additionalRemarks
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to create reservation.');
    }
  }

  static Future<bool> deleteReservation(String id) async {
    var url=Uri.parse(baseURL+"/"+id);
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete reservation.');
    }
  }
}