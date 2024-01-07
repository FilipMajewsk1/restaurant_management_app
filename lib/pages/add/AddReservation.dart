import 'package:flutter/material.dart';
import 'package:restaurant_management_app/ThemeManager.dart';
import 'package:restaurant_management_app/controllers/ClientController.dart';
import 'package:restaurant_management_app/controllers/ReservationController.dart';
import 'package:restaurant_management_app/controllers/TableController.dart';
import 'package:restaurant_management_app/models/Client.dart';
import 'package:restaurant_management_app/models/TTable.dart';
import 'package:restaurant_management_app/pages/add/ShowEntitiesFromAnotherClassCard.dart';

class AddReservation extends StatefulWidget {
  const AddReservation({Key? key}) : super(key: key);

  @override
  State<AddReservation> createState() => _AddReservationState();
}
class _AddReservationState extends State<AddReservation> {
  final ThemeManager _themeManager = ThemeManager();

  TextEditingController nameController = TextEditingController();
  TextEditingController ddateController = TextEditingController();
  TextEditingController hhourController = TextEditingController();
  TextEditingController guestNumController = TextEditingController();
  TextEditingController additionalRemarksController = TextEditingController();

  String name = "";
  String ddate = "";
  String hhour = "";
  Client? selectedClient;
  TTable? selectedTable;
  int? guestNum;
  String additionalRemarks = "";

  Future<List<Client>> clients = ClientController.getList();
  Future<List<TTable>> tables = TableController.getList();

  final _nameKey = GlobalKey<FormState>();
  final _dateKey = GlobalKey<FormState>();
  final _hourKey = GlobalKey<FormState>();
  final _guestNumKey = GlobalKey<FormState>();
  final _remarksKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _themeManager.isDarkMode ? Colors.grey[850] : Colors.white,
        appBar: AppBar(
          title: Text(
            "Add Reservation",
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
                  padding: const EdgeInsets.fromLTRB(0, 20, 260, 0),
                  child: Text(
                    "Date",
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
                    key: _dateKey,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: ddateController,
                            style:TextStyle(
                              color: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                            ),
                            cursorColor: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                            decoration:  InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText:'Enter date',
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
                              } else if (!RegExp(r'^[0-9-]+$').hasMatch(value)) {
                                return 'Enter only numbers and -';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: ElevatedButton.icon(
                            onPressed: (){
                              if (_dateKey.currentState?.validate() ?? false) {
                                setState(() {
                                  ddate = ddateController.text;
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
                  padding: const EdgeInsets.fromLTRB(0, 20, 260, 0),
                  child: Text(
                    "Hour",
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
                    key: _hourKey,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: hhourController,
                            style:TextStyle(
                              color: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                            ),
                            cursorColor: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                            decoration:  InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText:'Enter hour',
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
                              } else if (!RegExp(r'^[0-9:]+$').hasMatch(value)) {
                                return 'Enter only numbers and :';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: ElevatedButton.icon(
                            onPressed: (){
                              if (_hourKey.currentState?.validate() ?? false) {
                                setState(() {
                                  hhour = hhourController.text;
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
                  padding: const EdgeInsets.fromLTRB(0, 20, 185, 5),
                  child: Text(
                    "Guest number",
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
                    key: _guestNumKey,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: guestNumController,
                            style:TextStyle(
                              color: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                            ),
                            cursorColor: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                            decoration:  InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText:'Enter guest number',
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
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: ElevatedButton.icon(
                            onPressed: (){
                              if (_guestNumKey.currentState?.validate() ?? false) {
                                setState(() {
                                  guestNum = int.tryParse(guestNumController.text);
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
                  padding: const EdgeInsets.fromLTRB(0, 20, 150, 5),
                  child: Text(
                    "Additional remarks",
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
                    key: _remarksKey,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: additionalRemarksController,
                            style:TextStyle(
                              color: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                            ),
                            cursorColor: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                            decoration:  InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText:'Enter additional remarks',
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
                              if (_remarksKey.currentState?.validate() ?? false) {
                                setState(() {
                                  additionalRemarks = additionalRemarksController.text;
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
                  padding: const EdgeInsets.fromLTRB(0, 20, 260, 5),
                  child: Text(
                    "Client",
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
                  child: FutureBuilder<List<Client>>(
                      future: clients,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final clientt = snapshot.data!;
                          return buildClient(clientt);
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
                  padding: const EdgeInsets.all(25),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (nameController.text != ""
                          &&ddateController.text != ""
                          && hhourController.text != ""
                          && additionalRemarksController.text != ""
                          && guestNumController.text != "") {
                        name = nameController.text;
                        ddate = ddateController.text;
                        hhour = hhourController.text;
                        guestNum = int.tryParse(guestNumController.text);
                        additionalRemarks = additionalRemarksController.text;
                      }
                      if(name != "" &&
                          ddate != "" &&
                          hhour != "" &&
                          guestNum != null &&
                          additionalRemarks != "" &&
                          selectedClient != null &&
                          selectedTable != null) {

                        ReservationController.addReservation(name, ddate, hhour, selectedClient!.id, selectedTable!.id, guestNum!, additionalRemarks);
                        Navigator.pop(context);
                      }
                    },
                    icon: Icon(Icons.add),
                    label: Text(
                      "Add reservation",
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

  void selectClient(Client client) {
    setState(() {
      if (selectedClient == client) {
        selectedClient = null; // Deselect if the same client is selected again
      } else {
        selectedClient = client;
      }
    });
  }

  void selectTable(TTable table) {
    setState(() {
      if (selectedTable == table) {
        selectedTable = null; // Deselect if the same table is selected again
      } else {
        selectedTable = table;
      }
    });
  }

  Widget buildClient(List<Client> clients) =>
      ListView.builder(
        itemCount: clients.length,
        itemBuilder: (context, index) {
          final client = clients[index];
          return ShowEntitiesFromAnotherClassCard(
            name: client.name + " " + client.surname,
            id: client.id,
            isSelected: selectedClient == client,
            onSelect: () => selectClient(client),
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
}