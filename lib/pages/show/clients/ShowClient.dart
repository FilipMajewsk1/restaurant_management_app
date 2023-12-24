import 'package:flutter/material.dart';
import 'package:restaurant_management_app/ThemeManager.dart';
import 'package:restaurant_management_app/controllers/ClientController.dart';
import 'package:restaurant_management_app/models/Client.dart';

class ShowClient extends StatefulWidget{
  final int id;
  const ShowClient({
    Key? key,
    required this.id,
}) :super(key : key);

  @override
  State<ShowClient> createState() => _ShowClientState();
}

class _ShowClientState extends State<ShowClient> {
  final ThemeManager _themeManager = ThemeManager();

  late Future<Client> futureClient;
  late Client client;

  initState(){
    super.initState();
    futureClient = ClientController.getClient(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _themeManager.isDarkMode ? Colors.grey[850] : Colors.white,
      appBar: AppBar(
        title: FutureBuilder<Client>(
          future: futureClient,
          builder: (context, snapshot){
            if(snapshot.hasData) {
              return Text(snapshot.data!.name + " " + snapshot.data!.surname,
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
                  padding: const EdgeInsets.fromLTRB(0, 120, 235, 5),
                  child: Text(
                    "Email",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                    ),
                  ),
                ),
                SizedBox(
                  height: 110,
                  width: 300,
                  child: Card(
                    color: _themeManager.isDarkMode ? Colors.grey[850] : Colors.white,
                      child: Center(
                        child: SizedBox(
                          width: 200,
                          height: 60,
                          child: Card(
                            color: Colors.green[900],
                            child: Center(
                              child: FutureBuilder<Client>(
                                future: futureClient,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(snapshot.data!.email,
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

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 160, 5),
                  child: Text(
                    "Phone number",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: _themeManager.isDarkMode ? Colors.white : Colors.grey[850],
                    ),
                  ),
                ),
                SizedBox(
                  height: 110,
                  width: 300,
                  child: Card(
                    color: _themeManager.isDarkMode ? Colors.grey[850] : Colors.white,
                    child: Center(
                      child: SizedBox(
                        width: 200,
                        height: 60,
                        child: Card(
                          color: Colors.green[900],
                          child: Center(
                            child: FutureBuilder<Client>(
                              future: futureClient,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(snapshot.data!.phoneNum,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.white,
                                      ));
                                } else {
                                  return (Center(
                                      child:CircularProgressIndicator()));                                }
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