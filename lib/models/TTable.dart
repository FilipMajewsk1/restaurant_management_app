
class TTable{
  int id;
  String name;
  int size;

  TTable({
    required this.id,
    required this.name,
    required this.size
  });

  factory TTable.fromJson(Map<String, dynamic> json) {
    return TTable(
      id: json['id'],
      name: json['name'],
      size: json['size'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'size': size,
    };
  }
}