import 'package:flutter/material.dart';

class ShowTable extends StatefulWidget{
  final int id;
  const ShowTable({
    Key? key,
    required this.id,
  }) :super(key : key);

  @override
  State<ShowTable> createState() => _ShowTableState();
}

class _ShowTableState extends State<ShowTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}