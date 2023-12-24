import 'package:flutter/material.dart';
import 'package:restaurant_management_app/ThemeManager.dart';
import 'package:restaurant_management_app/controllers/TableController.dart';

class AddTable extends StatefulWidget {
  const AddTable({Key? key}) : super(key: key);

  @override
  State<AddTable> createState() => _AddTableState();
}
class _AddTableState extends State<AddTable> {
  final ThemeManager _themeManager = ThemeManager();
  TextEditingController nameController = TextEditingController();
  TextEditingController sizeController = TextEditingController();

  String name = "";
  int? size = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _themeManager.isDarkMode ? Colors.grey[850] : Colors.white,
        appBar: AppBar(
          title: Text(
            "Add Table",
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
                  padding: const EdgeInsets.fromLTRB(0, 45, 250, 5),
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
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter name',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              if (nameController.text != "") {
                                name = nameController.text;
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
                  padding: const EdgeInsets.fromLTRB(0, 45, 265, 5),
                  child: Text(
                    "Size",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: sizeController,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter size',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              if (sizeController.text != "") {
                                size = int.tryParse(sizeController.text);
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
                  padding: const EdgeInsets.all(50),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (nameController.text != ""
                          && sizeController.text != "" ) {
                        name = nameController.text;
                        size = int.tryParse(sizeController.text);
                      }
                      if(name != "") {
                        TableController.addTable(name, size!);
                        Navigator.pop(context);
                      }
                    },
                    icon: Icon(Icons.add),
                    label: Text(
                      "Add table",
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