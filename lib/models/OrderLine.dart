class OrderLine {
  int? id;
  int position_id;
  int quantity;

  OrderLine({
    this.id,
    required this.position_id,
    required this.quantity});

  factory OrderLine.fromJson(Map<String, dynamic> json) {
    return OrderLine(
      id: json['id'],
      position_id: json['position_id'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (id != null) {
      data['id'] = this.id;
    }
    data['position_id'] = this.position_id;
    data['quantity'] = this.quantity;
    return data;
  }
}