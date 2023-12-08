import 'package:flutter/material.dart';
import 'package:restaurant_management_app/models/Menu.dart';
import 'package:restaurant_management_app/controllers/MenuController.dart';
import 'package:restaurant_management_app/pages/show/menu/ShowMenuPosition.dart';
import 'package:restaurant_management_app/pages/show/widgets/ShowEntityCard.dart';

class ShowMenu extends StatefulWidget{
  const ShowMenu({Key? key}) : super(key: key);

  @override
  State<ShowMenu> createState() => _ShowMenu();
}

class _ShowMenu extends State<ShowMenu> {
  Future<List<Menu>> positions = MenuuController.getList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.green[900],
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          height: 650,
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
      ),
    );
  }

  Widget buildPosition(List<Menu> positions) =>
      ListView.builder(
        itemCount: positions.length,
        itemBuilder: (context, index) {
          final position = positions[index];
          return ShowEntityCard(
            name: position.dishName,
            id: position.id,
            route: () {
              ShowMenuPosition(id: position.id);
            },
            deleteFunc: () {
              MenuuController.deletePosition(position.id.toString());
            },
          );
        },
      );
}