import 'package:flutter/material.dart';

class Show extends StatefulWidget {
  const Show({Key? key}) : super(key: key);

  @override
  State<Show> createState() => _ShowState();
}

class _ShowState extends State<Show> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Show list of entities",
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
                  Navigator.pushNamed(context, '/show');
                },
                icon: Icon(Icons.list),
                label: Text(
                  "Clients",
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
                  Navigator.pushNamed(context, '/add');
                },
                icon: Icon(Icons.list),
                label: Text(
                  "Reservations",
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
                  Navigator.pushNamed(context, '/add');
                },
                icon: Icon(Icons.list),
                label: Text(
                  "Orders",
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
                  Navigator.pushNamed(context, '/add');
                },
                icon: Icon(Icons.list),
                label: Text(
                  "Menu",
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
                  Navigator.pushNamed(context, '/add');
                },
                icon: Icon(Icons.list),
                label: Text(
                  "Tables",
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