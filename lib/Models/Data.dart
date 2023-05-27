import 'dart:core';

class Data{
  late String first_name;
  late String last_name;
  late int id;
  late String email;
  late String  avatar;

  Data({
    required this.first_name,
    required this.last_name,
    required this.id,
    required this.email,
    required this.avatar,
  });

  factory Data.fromJson(Map<String, dynamic> json) {

    return Data(
      first_name: json['first_name'].toString(),
      last_name: json['last_name'].toString(),
      id: json['id'],
      email: json['email'].toString(),
      avatar: json['avatar'].toString()
    );
  }
}