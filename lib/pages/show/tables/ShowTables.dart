import 'package:flutter/material.dart';
import 'package:restaurant_management_app/ThemeManager.dart';
import 'package:restaurant_management_app/controllers/TableController.dart';
import 'package:restaurant_management_app/models/TTable.dart';
import 'package:restaurant_management_app/pages/show/tables/ShowTable.dart';
import 'package:restaurant_management_app/widgets/ShowEntityCard.dart';

class ShowTables extends StatefulWidget{
  const ShowTables({Key? key}) : super(key: key);

  @override
  State<ShowTables> createState() => _ShowTables();
}

class _ShowTables extends State<ShowTables> {
  final ThemeManager _themeManager = ThemeManager();
  Future<List<TTable>> tables = TableController.getList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _themeManager.isDarkMode ? Colors.grey[850] : Colors.white,
      appBar: AppBar(
        title: Text(
          "Tables",
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
      ),
    );
  }

  Widget buildTable(List<TTable> tables) =>
      ListView.builder(
        itemCount: tables.length,
        itemBuilder: (context, index) {
          final table = tables[index];
          return ShowEntityCard(
            name: table.name,
            id: table.id,
            route: (int id) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowTable(id: id)));
            },
            deleteFunc: (int id) {
              TableController.deleteTable(table.id.toString());
            },
          );
        },
      );
}