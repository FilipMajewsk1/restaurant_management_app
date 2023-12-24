import 'package:flutter/material.dart';
import 'package:restaurant_management_app/ThemeManager.dart';

class ShowOrderlineCard extends StatefulWidget {

  final String positionName;
  final int quantity;

  ShowOrderlineCard({required this.positionName, required this. quantity});

  @override
  State<ShowOrderlineCard> createState() => _ShowOrderlineCard(positionName: positionName, quantity: quantity);
}

class _ShowOrderlineCard extends State<ShowOrderlineCard> {
  final ThemeManager _themeManager = ThemeManager();
  String positionName;
  int quantity;

  _ShowOrderlineCard({required this.positionName, required this. quantity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 60,
      child: Card(
        color: Colors.green[900],
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  "Position: " + widget.positionName,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                "Quantity: " + widget.quantity.toString(),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}