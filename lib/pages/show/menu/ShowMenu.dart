import 'package:flutter/material.dart';

class ShowMenu extends StatefulWidget{
  const ShowMenu({Key? key}) : super(key: key);

  @override
  State<ShowMenu> createState() => _ShowMenu();
}

class _ShowMenu extends State<ShowMenu> {
  //TODO .getClientsList

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu",
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