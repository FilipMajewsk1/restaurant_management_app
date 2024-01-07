import 'package:flutter/material.dart';
import 'package:restaurant_management_app/ThemeManager.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ThemeManager _themeManager = ThemeManager();

  @override
  void initState() {
    super.initState();
    _initTheme();
  }

  Future<void> _initTheme() async {
    await _themeManager.loadUserTheme();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _themeManager.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "RestaurantManagement",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          backgroundColor: Colors.green[900],
          centerTitle: true,
          actions: [
            Switch(
              value: _themeManager.isDarkMode,
              onChanged: (value) async {
                await _themeManager.saveUserTheme(value);
                setState(() {});
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/show');
                  },
                  icon: const Icon(Icons.list),
                  label: const Text(
                    "Show",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green[900]),
                    fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/add');
                  },
                  icon: const Icon(Icons.add),
                  label: const Text(
                    "Add",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green[900]),
                    fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
