import 'dart:core';

class Album2{
  late String fact;
  late int length;

  Album2({
  required this.fact,
  required this.length,
  });

  factory Album2.fromJson(Map<String, dynamic> json) {
    return Album2(
        fact: json['fact'],
        length: json['length'],
    );
  }
}