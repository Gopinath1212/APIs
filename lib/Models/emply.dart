import 'dart:core';

class emply {
  late int employeeId;
  late String employeeName;
  late int mobile;
  late String userName;
  late String password;
  late String confirmPassword;
  late int createdBy;
  late String deviceld;

  emply({
    required this.employeeId,
    required this.employeeName,
    required this.mobile,
    required this.userName,
    required this.password,
    required this.confirmPassword,
    required this.createdBy,
    required this.deviceld,

  });

  factory emply.fromJson(Map<String, dynamic> json) {
    return emply(
      employeeId: json['employeeId'],
      employeeName: json['employeeName'],
      mobile: json['mobile'],
      userName: json['userName'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
      createdBy: json['createdBy'],
      deviceld: json['deviceld'],

    );
  }
}