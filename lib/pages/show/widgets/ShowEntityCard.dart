import 'package:flutter/material.dart';

class ShowEntityCard extends StatefulWidget {

  final String name;
  final int id;
  final VoidCallback route;
  final VoidCallback deleteFunc;


  ShowEntityCard({required this.name, required this.id, required this.route, required this.deleteFunc});

  @override
  State<ShowEntityCard> createState() => _ShowEntityCard(id: id, name: name, route: route, deleteFunc: deleteFunc);
}
class _ShowEntityCard extends State<ShowEntityCard> {
  String name;
  int? id;
  Function route;
  Function deleteFunc;

  _ShowEntityCard({required this.name, required this.id, required this.route, required this.deleteFunc});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 110,
      child: Card(
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 200,
                  height: 60,
                  child: Card(
                    color: Colors.green[900],
                    child: Center(
                      child: Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 3, 20, 0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => route(id: widget.id)));
                    },
                    icon: Icon(Icons.remove_red_eye),
                    label: Text('Show'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green[900]),
                      minimumSize: MaterialStateProperty.all(Size(100, 25)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      deleteFunc(widget.id.toString());
                      Navigator.pop(context);
                    },
                    icon:Icon(Icons.delete),
                    label: Text('Delete'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green[900]),
                      minimumSize: MaterialStateProperty.all(Size(100, 25)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}