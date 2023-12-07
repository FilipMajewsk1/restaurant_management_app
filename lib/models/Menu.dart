import 'MenuSections.dart';

class Menu {
  int id;
  String dishName;
  String dishDescription;
  int price;
  String allergens;
  MenuSections section;

  Menu({
    required this.id,
    required this.dishName,
    required this.dishDescription,
    required this.price,
    required this.allergens,
    required this.section
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      id: json['id'],
      dishName: json['dishName'],
      dishDescription: json['dishDescription'],
      price: json['price'],
      allergens: json['allergens'],
      section: _convertToMenuSection(json['section'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dishName': dishName,
      'dishDescription': dishDescription,
      'price': price,
      'allergens': allergens,
      'section': section.toString().split('.').last,
    };
  }

  static MenuSections _convertToMenuSection(String sectionStr) {
    return MenuSections.values.firstWhere(
          (e) => e.toString().split('.').last == sectionStr,
      orElse: () => throw ArgumentError('Nieznana sekcja menu: $sectionStr'),
    );
  }
}