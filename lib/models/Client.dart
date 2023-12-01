
class Client{
  int id;
  String name;
  String surname;
  String email;
  String phoneNum;

  Client({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.phoneNum
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'],
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      phoneNum: json['phoneNum'],
    );
  }
}