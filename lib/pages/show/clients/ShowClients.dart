import 'package:flutter/material.dart';
import '../../../models/Client.dart';

class ShowClients extends StatefulWidget{
  const ShowClients({Key? key}) : super(key: key);

  @override
  State<ShowClients> createState() => _ShowClients();
}

class _ShowClients extends State<ShowClients> {
  //TODO .getClientsList

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Clients",
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