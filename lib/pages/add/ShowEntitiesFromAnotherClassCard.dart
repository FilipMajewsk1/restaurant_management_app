import 'package:flutter/material.dart';
import 'package:restaurant_management_app/ThemeManager.dart';

class ShowEntitiesFromAnotherClassCard extends StatefulWidget {

  final String name;
  final int id;
  final bool isSelected;
  final VoidCallback onSelect;

  static int? selectedId;


  ShowEntitiesFromAnotherClassCard({
    required this.name,
    required this.id,
    required this.isSelected,
    required this.onSelect,});

  @override
  State<ShowEntitiesFromAnotherClassCard> createState() => _ShowEntitiesFromAnotherClassCard(id: id, name: name);
}
class _ShowEntitiesFromAnotherClassCard extends State<ShowEntitiesFromAnotherClassCard> {
  final ThemeManager _themeManager = ThemeManager();
  String name;
  int? id;

  _ShowEntitiesFromAnotherClassCard({required this.name, required this.id});

  @override
  Widget build(BuildContext context) {
    bool isChecked = ShowEntitiesFromAnotherClassCard.selectedId == widget.id;
    return SizedBox(
      width: 350,
      height: 110,
      child: Card(
        color: _themeManager.isDarkMode ? Colors.grey[850] : Colors.white,
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
                  padding: const EdgeInsets.fromLTRB(0, 28, 30, 0),
                  child: Checkbox(
                    value: widget.isSelected,
                    onChanged: (_) => widget.onSelect(),
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