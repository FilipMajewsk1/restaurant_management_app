import 'package:flutter/material.dart';
import 'package:restaurant_management_app/controllers/ClientController.dart';
import 'package:restaurant_management_app/controllers/ReservationController.dart';
import 'package:restaurant_management_app/controllers/TableController.dart';
import 'package:restaurant_management_app/models/Client.dart';
import 'package:restaurant_management_app/models/Reservation.dart';
import 'package:restaurant_management_app/models/TTable.dart';

class ShowReservation extends StatefulWidget{
  final int id;
  const ShowReservation({
    Key? key,
    required this.id,
    requ
  }) :super(key : key);

  @override
  State<ShowReservation> createState() => _ShowReservationState();
}

class _ShowReservationState extends State<ShowReservation> {

  late Future<Reservation> futureReservation;
  late Reservation reservation;
  late Future<Client> futureClient;
  late Future<TTable> futureTable;

  initState(){
    super.initState();
    futureReservation=ReservationController.getReservation(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<Reservation>(
          future: futureReservation,
          builder: (context, snapshot){
            if(snapshot.hasData) {
              return Text(snapshot.data!.name,
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
                  padding: const EdgeInsets.fromLTRB(0, 35, 235, 5),
                  child: Text(
                    "Date",
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
                            child: FutureBuilder<Reservation>(
                              future: futureReservation,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(snapshot.data!.ddate,
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
                  padding: const EdgeInsets.fromLTRB(0, 30, 240, 5),
                  child: Text(
                    "Hour",
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
                            child: FutureBuilder<Reservation>(
                              future: futureReservation,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(snapshot.data!.hhour,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.white,
                                      ));
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
                  padding: const EdgeInsets.fromLTRB(0, 30, 120, 5),
                  child: Text(
                    "Number of guests",
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
                            child: FutureBuilder<Reservation>(
                              future: futureReservation,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(snapshot.data!.guestNum.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.white,
                                      ));
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
                  padding: const EdgeInsets.fromLTRB(0, 30, 175, 5),
                  child: Text(
                    "Client name",
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
                            child: FutureBuilder<Reservation>(
                              future: futureReservation,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  futureClient = ClientController.getClient(snapshot.data!.client_id.toString());
                                  return FutureBuilder<Client>(
                                    future: futureClient,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(snapshot.data!.surname,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Colors.white,
                                            ));
                                      } else {
                                        return (Center(
                                            child:CircularProgressIndicator()));
                                      }
                                    },
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
                  padding: const EdgeInsets.fromLTRB(0, 30, 180, 5),
                  child: Text(
                    "Table name",
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
                            child: FutureBuilder<Reservation>(
                              future: futureReservation,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  futureTable = TableController.getTable(snapshot.data!.table_id.toString());
                                  return FutureBuilder<TTable>(
                                    future: futureTable,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(snapshot.data!.name,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Colors.white,
                                            ));
                                      } else {
                                        return (Center(
                                            child:CircularProgressIndicator()));
                                      }
                                    },
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

              ]
          ),
        ),
      ),
    );
  }
}