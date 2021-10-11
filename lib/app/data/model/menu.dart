// To parse this JSON data, do
//
//     final menu = menuFromJson(jsonString);

import 'dart:convert';

List<Menu> menuFromJson(String str) =>
    List<Menu>.from(json.decode(str).map((x) => Menu.fromJson(x)));

String menuToJson(List<Menu> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Menu {
  Menu({
    this.languageCode,
    this.categoryId,
    this.name,
    this.type,
  });

  String languageCode;
  int categoryId;
  String name;
  int type;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        languageCode: json["language_code"],
        categoryId: json["category_id"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "language_code": languageCode,
        "category_id": categoryId,
        "name": name,
        "type": type,
      };
}
