import 'package:flutter/material.dart';
import 'package:restaurant_management_app/pages/AddClient.dart';
import 'package:restaurant_management_app/pages/Home.dart';
import 'package:restaurant_management_app/pages/Add.dart';
import 'package:restaurant_management_app/pages/Show.dart';
void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/home': (context) => Home(),
    '/show': (context) => Show(),
    '/add': (context) => Add(),
    '/add_client': (context) => AddClient()
  },
));
