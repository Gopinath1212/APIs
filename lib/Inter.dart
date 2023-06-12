import 'dart:core';

import 'List.dart';

class Plans{
  late List<Department> departments;
  Plans({
    required this.departments
  });

  factory Plans.fromJson(Map<String, dynamic> json) {
    return Plans(
        departments: json['departments']==null?null:
        json['departments'].map((y)=>Plans.fromJson(y)).toList()
    );
  }
}