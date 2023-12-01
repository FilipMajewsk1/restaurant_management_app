import 'package:flutter/material.dart';

class ShowOrders extends StatefulWidget{
  const ShowOrders({Key? key}) : super(key: key);

  @override
  State<ShowOrders> createState() => _ShowOrders();
}

class _ShowOrders extends State<ShowOrders> {
  //TODO .getClientsList

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Orders",
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