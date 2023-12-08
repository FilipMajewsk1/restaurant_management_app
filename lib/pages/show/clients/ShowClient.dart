import 'package:flutter/material.dart';

class ShowClient extends StatefulWidget{
  final int id;
  const ShowClient({
    Key? key,
    required this.id,
}) :super(key : key);

  @override
  State<ShowClient> createState() => _ShowClientState();
}

class _ShowClientState extends State<ShowClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}