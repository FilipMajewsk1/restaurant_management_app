import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "RestaurantManagement",
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
              height: 240,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/show');
                },
                icon: Icon(Icons.list),
                label: Text(
                  "Show",
                  style: TextStyle(
                    fontSize: 24,
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
                  Navigator.pushNamed(context, '/add');
                },
                icon: Icon(Icons.add),
                label: Text(
                  "Add",
                  style: TextStyle(
                    fontSize: 24,
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