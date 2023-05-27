import 'dart:core';

class Raw {
  late int transactionModeId;
  late String transactionModeName;
  late int createdBy;
  late String userName;

  Raw({
    required this.transactionModeId,
    required this.transactionModeName,
    required this.createdBy,
    required this.userName,

  });

  factory Raw.fromJson(Map<String, dynamic> json) {
    return Raw(
      transactionModeId: json['transactionModeId'],
      transactionModeName: json['transactionModeName'],
      createdBy: json['createdBy'],
      userName: json['userName'],

    );
  }
}