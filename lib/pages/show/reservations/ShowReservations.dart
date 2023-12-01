import 'package:flutter/material.dart';

class ShowReservations extends StatefulWidget{
  const ShowReservations({Key? key}) : super(key: key);

  @override
  State<ShowReservations> createState() => _ShowReservations();
}

class _ShowReservations extends State<ShowReservations> {
  //TODO .getClientsList

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reservations",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.green[900],
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          height: 650,
          //TODO FutureBuilder
        ),
      ),
    );
  }
}