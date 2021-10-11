// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.statusCode,
    this.success,
    this.data,
    this.errors,
    this.message,
  });

  int statusCode;
  bool success;
  Data data;
  String message;
  List<Error> errors = new List();

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    var data;
    var errors;
    if (json["data"] != null) {
      data = Data.fromJson(json["data"]);
    } else {
      data = Data();
    }
    if (json["errors"] != null) {
      errors = List<Error>.from(json["errors"].map((x) => Error.fromJson(x)));
    } else {
      errors = List<Error>();
    }
    return LoginResponse(
      statusCode: json["statusCode"],
      success: json["success"],
      data: data,
      errors: errors,
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "success": success,
        "data": data.toJson(),
        "message": message,
        "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    this.token,
  });

  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}

class Error {
  Error({
    this.key,
    this.value,
  });

  String key;
  String value;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}
