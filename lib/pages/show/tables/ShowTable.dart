import 'package:flutter/material.dart';
import 'package:restaurant_management_app/controllers/TableController.dart';
import 'package:restaurant_management_app/models/TTable.dart';

class ShowTable extends StatefulWidget{
  final int id;
  const ShowTable({
    Key? key,
    required this.id,
  }) :super(key : key);

  @override
  State<ShowTable> createState() => _ShowTableState();
}

class _ShowTableState extends State<ShowTable> {

  late Future<TTable> futureTable;
  late TTable table;

  initState(){
    super.initState();
    futureTable=TableController.getTable(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<TTable>(
        future: futureTable,
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
                  padding: const EdgeInsets.fromLTRB(0, 240, 192, 5),
                  child: Text(
                    "Table size",
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
                            child: FutureBuilder<TTable>(
                              future: futureTable,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(snapshot.data!.size.toString(),
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

              ]
          ),
        ),
      ),
    );
  }
}