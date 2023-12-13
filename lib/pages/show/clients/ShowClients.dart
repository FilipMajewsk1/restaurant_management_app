import 'package:flutter/material.dart';
import 'package:restaurant_management_app/controllers/ClientController.dart';
import 'package:restaurant_management_app/models/Client.dart';
import 'package:restaurant_management_app/pages/show/clients/ShowClient.dart';
import 'package:restaurant_management_app/widgets/ShowEntityCard.dart';


class ShowClients extends StatefulWidget{
  const ShowClients({Key? key}) : super(key: key);

  @override
  State<ShowClients> createState() => _ShowClients();
}

class _ShowClients extends State<ShowClients> {
  Future<List<Client>> clients = ClientController.getList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Clients",
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
      ),
    );
  }

  Widget buildClient(List<Client> clients) =>
      ListView.builder(
        itemCount: clients.length,
        itemBuilder: (context, index) {
          final client = clients[index];
          return ShowEntityCard(
            name: client.name + " " + client.surname,
            id: client.id,
            route: (int id) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowClient(id: id)));
            },
            deleteFunc: (int id) {
              ClientController.deleteClient(client.id.toString());
            },
          );
        },

      );
}