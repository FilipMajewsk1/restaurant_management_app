import 'package:flutter/material.dart';
import 'package:restaurant_management_app/ThemeManager.dart';
import 'package:restaurant_management_app/controllers/MenuController.dart';
import 'package:restaurant_management_app/models/MenuSections.dart';
import 'package:restaurant_management_app/pages/add/ShowMenuSectionsCard.dart';

class AddMenuPosition extends StatefulWidget {
  const AddMenuPosition({Key? key}) : super(key: key);

  @override
  State<AddMenuPosition> createState() => _AddMenuPositionState();
}
class  _AddMenuPositionState extends State<AddMenuPosition> {
  final ThemeManager _themeManager = ThemeManager();
  TextEditingController dishNameController = TextEditingController();
  TextEditingController dishDescriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController allergensController = TextEditingController();

  String dishName = "";
  String dishDescription = "";
  int? price;
  String allergens = "";
  MenuSections? selectedSection;
  List<MenuSections> sections = [MenuSections.Appetizer, MenuSections.Dessert, MenuSections.MainCourse, MenuSections.Soup];

  final _nameKey = GlobalKey<FormState>();
  final _descriptionKey = GlobalKey<FormState>();
  final _priceKey = GlobalKey<FormState>();
  final _allergensKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _themeManager.isDarkMode ? Colors.grey[850] : Colors.white,
        appBar: AppBar(
          title: Text(
            "Add Menu Position",
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
                  child: Form(
                    key:_nameKey,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: dishNameController,
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
                          padding: const EdgeInsets.fromLTRB(10,15,0,0),
                          child: ElevatedButton.icon(
                            onPressed: (){
                              if (_nameKey.currentState?.validate() ?? false) {
                                setState(() {
                                  dishName = dishNameController.text;
                                });
                              };
                            },
                            icon: Icon(Icons.check),
                            label: Text("Enter") ,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.green[900]),
                              minimumSize: MaterialStateProperty.all(Size(100, 35)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 45, 240, 5),
                  child: Text(
                    "Section",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                    ),
                  ),
                ),
                SizedBox(
                    width: 350,
                    height: 200,
                    child: buildSection(sections),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(17, 45, 225, 5),
                  child: Text(
                    "Description",
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
                    key: _descriptionKey,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: dishDescriptionController,
                            style:TextStyle(
                              color: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                            ),
                            cursorColor: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                            decoration:  InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText:'Enter description',
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
                          padding: const EdgeInsets.fromLTRB(10,15,0,0),
                          child: ElevatedButton.icon(
                            onPressed: (){
                              if (_descriptionKey.currentState?.validate() ?? false) {
                                setState(() {
                                  dishDescription = dishDescriptionController.text;
                                });
                              };
                            },
                            icon: Icon(Icons.check),
                            label: Text("Enter") ,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.green[900]),
                              minimumSize: MaterialStateProperty.all(Size(100, 35)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 45, 255, 5),
                  child: Text(
                    "Price",
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
                    key: _priceKey,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: priceController,
                            style:TextStyle(
                              color: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                            ),
                            cursorColor: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                            decoration:  InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText:'Enter price',
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
                          padding: const EdgeInsets.fromLTRB(10,15,0,0),
                          child: ElevatedButton.icon(
                            onPressed: (){
                              if (_priceKey.currentState?.validate() ?? false) {
                                setState(() {
                                  price = int.tryParse(priceController.text);
                                });
                              };
                            },
                            icon: Icon(Icons.check),
                            label: Text("Enter") ,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.green[900]),
                              minimumSize: MaterialStateProperty.all(Size(100, 35)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 45, 210, 5),
                  child: Text(
                    "Allergenes",
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
                    key: _allergensKey,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: allergensController,
                            style:TextStyle(
                              color: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                            ),
                            cursorColor: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                            decoration:  InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText:'Enter allergens',
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
                          padding: const EdgeInsets.fromLTRB(10,15,0,0),
                          child: ElevatedButton.icon(
                            onPressed: (){
                              if (_allergensKey.currentState?.validate() ?? false) {
                                setState(() {
                                  allergens = allergensController.text;
                                });
                              };
                            },
                            icon: Icon(Icons.check),
                            label: Text("Enter") ,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.green[900]),
                              minimumSize: MaterialStateProperty.all(Size(100, 35)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(50),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (dishNameController.text != ""
                          && dishDescriptionController.text != ""
                          && allergensController.text != "" && priceController.text != "") {
                        dishName = dishNameController.text;
                        dishDescription = dishDescriptionController.text;
                        allergens = allergensController.text;
                        price = int.tryParse(priceController.text);
                      }
                      if(dishName != ""
                          && dishDescription != ""
                          && allergens != ""
                          && price != null
                          && selectedSection != null){
                        MenuuController.addPosition(dishName, dishDescription, price!, allergens, selectedSection!.name);
                        Navigator.pop(context);
                      }
                    },
                    icon: Icon(Icons.add),
                    label: Text(
                      "Add position",
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

  void selectSection(MenuSections section) {
    setState(() {
      if (selectedSection == section) {
        selectedSection = null;
      } else {
        selectedSection = section;
      }
    });
  }

  Widget buildSection(List<MenuSections> sections) =>
      ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index) {
          final sectionn = sections[index];
          return ShowMenuSectionsCard(
            name: sectionn.name,
            isSelected: selectedSection == sectionn,
            onSelect: () => selectSection(sectionn),
          );
        },
      );
}