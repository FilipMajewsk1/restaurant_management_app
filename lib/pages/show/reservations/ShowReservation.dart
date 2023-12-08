import 'package:flutter/material.dart';

class ShowReservation extends StatefulWidget{
  final int id;
  const ShowReservation({
    Key? key,
    required this.id,
  }) :super(key : key);

  @override
  State<ShowReservation> createState() => _ShowReservationState();
}

class _ShowReservationState extends State<ShowReservation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}