import 'dart:core';


class Department{

  final String? name;
  final String? status;

  Department({this.status, this.name});

  factory Department.fromJson(Map<String, dynamic> json) {

    return Department(
        name: json['name'].toString(),
      status: json["status"]
      );
  }
}