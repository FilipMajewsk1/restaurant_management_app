import 'package:flutter/material.dart';

class ShowTables extends StatefulWidget{
  const ShowTables({Key? key}) : super(key: key);

  @override
  State<ShowTables> createState() => _ShowTables();
}

class _ShowTables extends State<ShowTables> {
  //TODO .getClientsList

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tables",
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