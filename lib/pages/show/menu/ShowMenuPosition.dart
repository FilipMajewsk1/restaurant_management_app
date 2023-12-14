import 'package:flutter/material.dart';
import 'package:restaurant_management_app/controllers/MenuController.dart';
import 'package:restaurant_management_app/models/Menu.dart';

class ShowMenuPosition extends StatefulWidget{
  final int id;
  const ShowMenuPosition({
    Key? key,
    required this.id,
  }) :super(key : key);

  @override
  State<ShowMenuPosition> createState() => _ShowMenuPositionState();
}

class _ShowMenuPositionState extends State<ShowMenuPosition> {

  late Future<Menu> futurePosition;
  late Menu position;

  initState(){
    super.initState();
    futurePosition = MenuuController.getPosition(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<Menu>(
          future: futurePosition,
          builder: (context, snapshot){
            if(snapshot.hasData) {
              return Text(snapshot.data!.dishName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ));
            } else {
              return Text('');
            }
          },
        ),
        backgroundColor: Colors.green[900],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 34, 220, 5),
                  child: Text(
                    "Section",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 110,
                  width: 300,
                  child: Card(
                    child: Center(
                      child: SizedBox(
                        width: 200,
                        height: 60,
                        child: Card(
                          color: Colors.green[900],
                          child: Center(
                            child: FutureBuilder<Menu>(
                              future: futurePosition,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(snapshot.data!.section.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.white,
                                      ));
                                } else {
                                  return (Center(
                                      child:CircularProgressIndicator()));                                  }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 180, 5),
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 240,
                  width: 300,
                  child: Card(
                    child: Center(
                      child: SizedBox(
                        width: 270,
                        height: 150,
                        child: Card(
                          color: Colors.green[900],
                          child: Center(
                            child: FutureBuilder<Menu>(
                              future: futurePosition,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(10,0,10,0),
                                    child: Text(snapshot.data!.dishDescription,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.white,
                                        )),
                                  );
                                } else {
                                  return (Center(
                                      child:CircularProgressIndicator()));                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 234, 5),
                  child: Text(
                    "Price",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 110,
                  width: 300,
                  child: Card(
                    child: Center(
                      child: SizedBox(
                        width: 200,
                        height: 60,
                        child: Card(
                          color: Colors.green[900],
                          child: Center(
                            child: FutureBuilder<Menu>(
                              future: futurePosition,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(snapshot.data!.price.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.white,
                                      ));
                                } else {
                                  return (Center(
                                      child:CircularProgressIndicator()));                                  }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 195, 5),
                  child: Text(
                    "Allergens",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 110,
                  width: 300,
                  child: Card(
                    child: Center(
                      child: SizedBox(
                        width: 200,
                        height: 60,
                        child: Card(
                          color: Colors.green[900],
                          child: Center(
                            child: FutureBuilder<Menu>(
                              future: futurePosition,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(snapshot.data!.allergens,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.white,
                                      ));
                                } else {
                                  return (Center(
                                      child:CircularProgressIndicator()));                                  }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ]
          ),
        ),
      ),
    );
  }
}