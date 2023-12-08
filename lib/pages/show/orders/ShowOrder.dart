import 'package:flutter/material.dart';

class ShowOrder extends StatefulWidget{
  final int id;
  const ShowOrder({
    Key? key,
    required this.id,
  }) :super(key : key);

  @override
  State<ShowOrder> createState() => _ShowOrderState();
}

class _ShowOrderState extends State<ShowOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}