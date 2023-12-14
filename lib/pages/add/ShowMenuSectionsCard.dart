import 'package:flutter/material.dart';

class ShowMenuSectionsCard extends StatefulWidget {

  final String name;
  final bool isSelected;
  final VoidCallback onSelect;

  static String? selectedSection;


  ShowMenuSectionsCard({
    required this.name,
    required this.isSelected,
    required this.onSelect,});

  @override
  State<ShowMenuSectionsCard> createState() => _ShowMenuSectionsCard( name: name);
}
class _ShowMenuSectionsCard extends State<ShowMenuSectionsCard> {
  String name;

  _ShowMenuSectionsCard({required this.name});

  @override
  Widget build(BuildContext context) {
    bool isChecked = ShowMenuSectionsCard.selectedSection == widget.name;
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