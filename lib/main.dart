import 'package:flutter/material.dart';
import 'package:restaurant_management_app/pages/add/AddClient.dart';
import 'package:restaurant_management_app/pages/Home.dart';
import 'package:restaurant_management_app/pages/add/Add.dart';
import 'package:restaurant_management_app/pages/add/AddMenuPosition.dart';
import 'package:restaurant_management_app/pages/add/AddReservation.dart';
import 'package:restaurant_management_app/pages/add/AddTable.dart';
import 'package:restaurant_management_app/pages/show/Show.dart';
import 'package:restaurant_management_app/pages/show/clients/ShowClients.dart';
import 'package:restaurant_management_app/pages/show/menu/ShowMenu.dart';
import 'package:restaurant_management_app/pages/show/orders/ShowOrders.dart';
import 'package:restaurant_management_app/pages/show/reservations/ShowReservations.dart';
import 'package:restaurant_management_app/pages/show/tables/ShowTables.dart';

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
    '/show_clients': (context) => ShowClients(),
    '/show_tables': (context) => ShowTables(),
    '/show_menu': (context) => ShowMenu(),
    '/show_reservations': (context) => ShowReservations(),
    '/show_orders': (context) => ShowOrders(),
  },
));
