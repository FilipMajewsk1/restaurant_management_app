import 'package:flutter/material.dart';
import 'package:restaurant_management_app/ThemeManager.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final ThemeManager _themeManager = ThemeManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _themeManager.isDarkMode ? Colors.grey[850] : Colors.white,
      appBar: AppBar(
        title: Text(
          "Add new entity",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.green[900],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/add_client');
                },
                icon: Icon(Icons.add),
                label: Text(
                  "Client",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green[900]),
                  fixedSize: MaterialStateProperty.all(Size(200,50)),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton.icon(
                onPressed: ()async {
                  Navigator.pushNamed(context, '/add_reservation');
                },
                icon: Icon(Icons.add),
                label: Text(
                  "Reservation",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green[900]),
                  fixedSize: MaterialStateProperty.all(Size(200,50)),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton.icon(
                onPressed: ()async {
                  Navigator.pushNamed(context, '/add_order');
                },
                icon: Icon(Icons.add),
                label: Text(
                  "Order",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green[900]),
                  fixedSize: MaterialStateProperty.all(Size(200,50)),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton.icon(
                onPressed: ()async {
                  Navigator.pushNamed(context, '/add_menu_position');
                },
                icon: Icon(Icons.add),
                label: Text(
                  "Menu Position",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green[900]),
                  fixedSize: MaterialStateProperty.all(Size(200,50)),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton.icon(
                onPressed: ()async {
                  Navigator.pushNamed(context, '/add_table');
                },
                icon: Icon(Icons.add),
                label: Text(
                  "Table",
                  style: TextStyle(
                    fontSize:18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green[900]),
                  fixedSize: MaterialStateProperty.all(Size(200,50)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}