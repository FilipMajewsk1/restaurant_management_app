import 'package:flutter/material.dart';
import 'package:restaurant_management_app/controllers/OrderController.dart';
import 'package:restaurant_management_app/controllers/ReservationController.dart';
import 'package:restaurant_management_app/controllers/TableController.dart';
import 'package:restaurant_management_app/models/Menu.dart';
import 'package:restaurant_management_app/models/Order.dart';
import 'package:restaurant_management_app/models/OrderLine.dart';
import 'package:restaurant_management_app/models/Reservation.dart';
import 'package:restaurant_management_app/models/TTable.dart';

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

  late Future<Order> futureOrder;
  late Future<TTable> futureTable;
  late Future<Reservation> futureReservation;
  late Future<Menu> futurePosition;
  late Order order;

  initState(){
    super.initState();
    futureOrder = OrderController.getOrder(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<Order>(
          future: futureOrder,
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
                            child: FutureBuilder<Order>(
                              future: futureOrder,
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

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 120, 5),
                  child: Text(
                    "Reservation name",
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
                            child: FutureBuilder<Order>(
                              future: futureOrder,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  futureReservation = ReservationController.getReservation(snapshot.data!.reservation_id.toString());
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