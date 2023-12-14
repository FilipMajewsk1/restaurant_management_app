import 'package:flutter/material.dart';
import 'package:restaurant_management_app/controllers/MenuController.dart';
import 'package:restaurant_management_app/models/MenuSections.dart';
import 'package:restaurant_management_app/pages/add/ShowMenuSectionsCard.dart';

class AddMenuPosition extends StatefulWidget {
  const AddMenuPosition({Key? key}) : super(key: key);

  @override
  State<AddMenuPosition> createState() => _AddMenuPositionState();
}
class  _AddMenuPositionState extends State<AddMenuPosition> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: dishNameController,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText:'Enter name',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,15,0,0),
                        child: ElevatedButton.icon(
                          onPressed: (){
                            setState(() {
                              if (dishNameController.text != "") {
                                dishName = dishNameController.text;
                              }
                            });
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

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 45, 240, 5),
                  child: Text(
                    "Section",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
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
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: dishDescriptionController,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText:'Enter description',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,15,0,0),
                        child: ElevatedButton.icon(
                          onPressed: (){
                            setState(() {
                              if (dishDescriptionController.text != "") {
                                dishDescription = dishDescriptionController.text;
                              }
                            });
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

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 45, 255, 5),
                  child: Text(
                    "Price",
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
                          controller: priceController,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText:'Enter price',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,15,0,0),
                        child: ElevatedButton.icon(
                          onPressed: (){
                            setState(() {
                              if (priceController.text != "") {
                                price = int.tryParse(priceController.text);
                              }
                            });
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

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 45, 210, 5),
                  child: Text(
                    "Allergenes",
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
                          controller: allergensController,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText:'Enter allergenes',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,15,0,0),
                        child: ElevatedButton.icon(
                          onPressed: (){
                            setState(() {
                              if (allergensController.text != "") {
                                allergens = allergensController.text;
                              }
                            });
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