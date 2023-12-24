import 'package:flutter/material.dart';
import 'package:restaurant_management_app/ThemeManager.dart';
import 'package:restaurant_management_app/controllers/ClientController.dart';

class AddClient extends StatefulWidget {
  const AddClient({Key? key}) : super(key: key);

  @override
  State<AddClient> createState() => _AddClientState();
}
class _AddClientState extends State<AddClient> {
  final ThemeManager _themeManager = ThemeManager();

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();

  String name = "";
  String surname = "";
  String email = "";
  String phoneNum = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _themeManager.isDarkMode ? Colors.grey[850] : Colors.white,
        appBar: AppBar(
        title: Text(
        "Add Client",
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
                      labelText:'Enter name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,15,0,0),
                  child: ElevatedButton.icon(
                    onPressed: (){
                      setState(() {
                        if (nameController.text != "") {
                          name = nameController.text;
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
            padding: const EdgeInsets.fromLTRB(17, 45, 245, 5),
            child: Text(
              "Surname",
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
                    controller: surnameController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText:'Enter surname',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,15,0,0),
                  child: ElevatedButton.icon(
                    onPressed: (){
                      setState(() {
                        if (surnameController.text != "") {
                          surname = surnameController.text;
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
              "Email",
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
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText:'Enter email',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,15,0,0),
                  child: ElevatedButton.icon(
                    onPressed: (){
                      setState(() {
                        if (emailController.text != "") {
                          email = emailController.text;
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
            padding: const EdgeInsets.fromLTRB(0, 45, 180, 5),
            child: Text(
              "Phone Number",
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
                    controller: phoneNumController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText:'Enter phone number',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,15,0,0),
                  child: ElevatedButton.icon(
                    onPressed: (){
                      setState(() {
                        if (phoneNumController.text != "") {
                          phoneNum = phoneNumController.text;
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
                if (nameController.text != ""
                    && surnameController.text != ""
                    && emailController.text != ""
                    && phoneNumController.text != "") {
                  name = nameController.text;
                  surname = surnameController.text;
                  email = emailController.text;
                  phoneNum = phoneNumController.text;
                }
                if(name != ""
                   && surname != ""
                   && email != ""
                   && phoneNum != "") {
                  ClientController.addClient(name, surname, email, phoneNum);
                  Navigator.pop(context);
                }
              },
              icon: Icon(Icons.add),
              label: Text(
                "Add client",
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