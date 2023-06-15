import 'dart:core';

import 'List.dart';

class Plans{
   List<Department>? departments;
  Plans({
    required this.departments
  });

  factory Plans.fromJson(Map<String, dynamic> json) {

    Iterable dep = json["departments"];

    return Plans(
        departments: json['departments']==null?null:
        dep.map((y)=>Department.fromJson(y)).toList()
    );
  }
}
