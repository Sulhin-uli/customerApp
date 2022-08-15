// To parse this JSON data, do
//
//     final heroModel = heroModelFromJson(jsonString);

import 'dart:convert';

HeroModel heroModelFromJson(String str) => HeroModel.fromJson(json.decode(str));

String heroModelToJson(HeroModel data) => json.encode(data.toJson());

class HeroModel {
  HeroModel({
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory HeroModel.fromJson(Map<String, dynamic> json) => HeroModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
