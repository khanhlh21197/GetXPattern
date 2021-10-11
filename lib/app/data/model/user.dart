// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.phoneNumber,
    this.password,
    this.confirmPassword,
  });

  String phoneNumber;
  String password;
  String confirmPassword;

  factory User.fromJson(Map<String, dynamic> json) => User(
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "password": password,
        "confirmPassword": confirmPassword,
      };
}
