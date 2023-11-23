import 'package:flutter/material.dart';

class AddReservation extends StatefulWidget {
  const AddReservation({Key? key}) : super(key: key);

  @override
  State<AddReservation> createState() => _AddReservationState();
}
class _AddReservationState extends State<AddReservation> {

  TextEditingController ddateController = TextEditingController();
  TextEditingController hhourController = TextEditingController();
  TextEditingController clientController = TextEditingController();
  TextEditingController tableController = TextEditingController();
  TextEditingController guestNumController = TextEditingController();
  TextEditingController additionalRemarksController = TextEditingController();

  String ddate = "";
  String hhour = "";
  String client = "";
  String table = "";
  int? guestNum;
  String additionalRemarks = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Date",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: ddateController,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter date',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              if (ddateController.text != "") {
                                ddate = ddateController.text;
                              }
                            });
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

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 260, 0),
                  child: Text(
                    "Hour",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: hhourController,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter hour',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              if (hhourController.text != "") {
                                hhour = hhourController.text;
                              }
                            });
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

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 250, 5),
                  child: Text(
                    "Client",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: clientController,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter client',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              if (clientController.text != "") {
                                client = clientController.text;
                              }
                            });
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

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 250, 5),
                  child: Text(
                    "Table",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: tableController,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter table',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              if (tableController.text != "") {
                                table = tableController.text;
                              }
                            });
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

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 185, 5),
                  child: Text(
                    "Guest number",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: guestNumController,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter guest number',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              if (guestNumController.text != "") {
                                guestNum = int.tryParse(guestNumController.text);
                              }
                            });
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

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 150, 5),
                  child: Text(
                    "Additional remarks",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: additionalRemarksController,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter additional remarks',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              if (additionalRemarksController.text != "") {
                                additionalRemarks = additionalRemarksController.text;
                              }
                            });
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

                Padding(
                  padding: const EdgeInsets.all(25),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (ddateController.text != ""
                          && hhourController.text != ""
                          && clientController.text != ""
                          && tableController.text != ""
                          && additionalRemarksController.text != "") {
                        ddate = ddateController.text;
                        hhour = hhourController.text;
                        client = clientController.text;
                        table = tableController.text;
                        additionalRemarks = additionalRemarksController.text;
                      }
                      if(ddate != "") {

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
}