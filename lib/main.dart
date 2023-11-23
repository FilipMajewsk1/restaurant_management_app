import 'package:flutter/material.dart';
import 'package:restaurant_management_app/pages/add/AddClient.dart';
import 'package:restaurant_management_app/pages/Home.dart';
import 'package:restaurant_management_app/pages/add/Add.dart';
import 'package:restaurant_management_app/pages/add/AddMenuPosition.dart';
import 'package:restaurant_management_app/pages/add/AddReservation.dart';
import 'package:restaurant_management_app/pages/add/AddTable.dart';
import 'package:restaurant_management_app/pages/show/Show.dart';
void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/home': (context) => Home(),
    '/show': (context) => Show(),
    '/add': (context) => Add(),
    '/add_client': (context) => AddClient(),
    '/add_table': (context) => AddTable(),
    '/add_menu_position': (context) => AddMenuPosition(),
    '/add_reservation': (context) => AddReservation(),
    '/add_order': (context) => Add(),
    '/show_clients': (context) => Show(),
    '/show_tables': (context) => Show(),
    '/show_menu': (context) => Show(),
    '/show_reservations': (context) => Show(),
    '/show_orders': (context) => Show(),
  },
));
