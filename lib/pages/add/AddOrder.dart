import 'package:flutter/material.dart';
import 'package:restaurant_management_app/ThemeManager.dart';
import 'package:restaurant_management_app/controllers/MenuController.dart';
import 'package:restaurant_management_app/controllers/OrderController.dart';
import 'package:restaurant_management_app/controllers/ReservationController.dart';
import 'package:restaurant_management_app/controllers/TableController.dart';
import 'package:restaurant_management_app/models/Menu.dart';
import 'package:restaurant_management_app/models/OrderLine.dart';
import 'package:restaurant_management_app/models/Reservation.dart';
import 'package:restaurant_management_app/models/TTable.dart';
import 'package:restaurant_management_app/pages/add/ShowEntitiesFromAnotherClassCard.dart';
import 'package:restaurant_management_app/widgets/ShowOrderlineCard.dart';

class AddOrder extends StatefulWidget {
  const AddOrder({Key? key}) : super(key: key);

  @override
  State<AddOrder> createState() => _AddOrderState();
}
class _AddOrderState extends State<AddOrder> {
  final ThemeManager _themeManager = ThemeManager();

  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  String name = "";
  Reservation? selectedReservation;
  TTable? selectedTable;
  Menu? selectedPosition;
  List<OrderLine> lines = [];
  OrderLine? line;
  int? quantity = 0;

  Future<List<Reservation>> reservations = ReservationController.getList();
  Future<List<TTable>> tables = TableController.getList();
  Future<List<Menu>> positions = MenuuController.getList();

  final _nameKey = GlobalKey<FormState>();
  final _quantityKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _themeManager.isDarkMode ? Colors.grey[850] : Colors.white,
        appBar: AppBar(
          title: Text(
            "Add Order",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          backgroundColor: Colors.green[900],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 260, 0),
                  child: Text(
                    "Name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Form(
                    key: _nameKey,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: nameController,
                            style:TextStyle(
                              color: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                            ),
                            cursorColor: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                            decoration:  InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText:'Enter name',
                              labelStyle: TextStyle(
                                color: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                              ),
                              errorStyle: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: ElevatedButton.icon(
                            onPressed: (){
                              if (_nameKey.currentState?.validate() ?? false) {
                                setState(() {
                                  name = nameController.text;
                                });
                              };
                            },
                            icon: Icon(Icons.check),
                            label: Text("Enter"),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors
                                  .green[900]),
                              minimumSize: MaterialStateProperty.all(Size(
                                  100, 35)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 210, 5),
                  child: Text(
                    "Reservation",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                    ),
                  ),
                ),
                SizedBox(
                  width: 350,
                  height: 250,
                  child: FutureBuilder<List<Reservation>>(
                      future: reservations,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final reservationn = snapshot.data!;
                          return buildReservation(reservationn);
                        }
                        else {
                          return (Center(
                              child:CircularProgressIndicator()));
                        }
                      }
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 260, 5),
                  child: Text(
                    "Table",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                    ),
                  ),
                ),
                SizedBox(
                  width: 350,
                  height: 250,
                  child: FutureBuilder<List<TTable>>(
                      future: tables,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final tablee = snapshot.data!;
                          return buildTable(tablee);
                        }
                        else {
                          return (Center(
                              child:CircularProgressIndicator()));
                        }
                      }
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 260, 5),
                  child: Text(
                    "Orderlines",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: buildLine(lines),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 260, 5),
                  child: Text(
                    "Menu Positions",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                    ),
                  ),
                ),
                SizedBox(
                  width: 350,
                  height: 200,
                  child: FutureBuilder<List<Menu>>(
                      future: positions,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final positionn = snapshot.data!;
                          return buildPosition(positionn);
                        }
                        else {
                          return (Center(
                              child:CircularProgressIndicator()));
                        }
                      }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 260, 5),
                  child: Text(
                    "Quantity",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Form(
                    key: _quantityKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: quantityController,
                          style:TextStyle(
                            color: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                          ),
                          cursorColor: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                          decoration:  InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText:'Enter quantity',
                            labelStyle: TextStyle(
                              color: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                            ),
                            errorStyle: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field cannot be empty';
                            } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return 'Enter only numbers';
                            }
                            return null;
                          },
                        ),

                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: ElevatedButton.icon(
                      onPressed: (){
                        if (_quantityKey.currentState?.validate() != false && selectedPosition!=null) {
                          setState(() {
                            quantity = int.tryParse(quantityController.text);
                            line = OrderLine(position_id: selectedPosition!.id, quantity: quantity!);
                            lines.add(line!);
                          });
                        };
                      },
                      icon: Icon(Icons.check),
                      label: Text("Enter"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors
                            .green[900]),
                        minimumSize: MaterialStateProperty.all(Size(
                            100, 35)),
                      ),
                    ),
                ),
                      ],
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(25),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (nameController.text.isNotEmpty &&
                          selectedReservation != null &&
                          selectedTable != null &&
                          lines.isNotEmpty) {
                        OrderController.addOrder(
                            nameController.text,
                            selectedTable!.id,
                            selectedReservation!.id,
                            lines
                        ).then((success) {
                          if (success) {
                            Navigator.pop(context);
                          } else {
                            print("Failed to add order");
                          }
                        });
                      } else {
                        print("Some fields are missing");
                      }
                    },
                    icon: Icon(Icons.add),
                    label: Text(
                      "Add Order",
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

              ],
            ),
          ),
        )
    );
  }

  void selectReservation(Reservation reservation) {
    setState(() {
      if (selectedReservation == reservation) {
        selectedReservation = null;
      } else {
        selectedReservation = reservation;
      }
    });
  }

  void selectTable(TTable table) {
    setState(() {
      if (selectedTable == table) {
        selectedTable = null;
      } else {
        selectedTable = table;
      }
    });
  }

  void selectPosition(Menu position) {
    setState(() {
      if (selectedPosition == position) {
        selectedPosition = null;
      } else {
        selectedPosition = position;
      }
    });
  }

  Widget buildReservation(List<Reservation> reservations) =>
      ListView.builder(
        itemCount: reservations.length,
        itemBuilder: (context, index) {
          final reservation = reservations[index];
          return ShowEntitiesFromAnotherClassCard(
            name: reservation.name,
            id: reservation.id,
            isSelected: selectedReservation == reservation,
            onSelect: () => selectReservation(reservation),
          );
        },
      );

  Widget buildTable(List<TTable> tables) =>
      ListView.builder(
        itemCount: tables.length,
        itemBuilder: (context, index) {
          final table = tables[index];
          return ShowEntitiesFromAnotherClassCard(
            name: table.name,
            id: table.id,
            isSelected: selectedTable == table,
            onSelect: () => selectTable(table),
          );
        },
      );

  Widget buildPosition(List<Menu> positions) =>
      ListView.builder(
        itemCount: positions.length,
        itemBuilder: (context, index) {
          final position = positions[index];
          return ShowEntitiesFromAnotherClassCard(
            name: position.dishName,
            id: position.id,
            isSelected: selectedPosition == position,
            onSelect: () => selectPosition(position),
          );
        },
      );

  Widget buildLine(List<OrderLine> lines) => ListView.builder(
    itemCount: lines.length,
    itemBuilder: (context, index) {
      final line = lines[index];

      return FutureBuilder<Menu>(
        future: MenuuController.getPosition(line.position_id.toString()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ShowOrderlineCard(
              positionName: snapshot.data!.dishName,
              quantity: line.quantity,
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      );
    },
  );
}