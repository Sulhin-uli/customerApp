// To parse this JSON data, do
//
//     final toko = tokoFromJson(jsonString);

import 'dart:convert';

Toko tokoFromJson(String str) => Toko.fromJson(json.decode(str));

String tokoToJson(Toko data) => json.encode(data.toJson());

class Toko {
  Toko({
    this.id,
    this.userId,
    this.chairman,
    this.city,
    this.address,
    this.telp,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  String? chairman;
  String? city;
  String? address;
  int? telp;
  dynamic image;
  dynamic createdAt;
  dynamic updatedAt;

  factory Toko.fromJson(Map<String, dynamic> json) => Toko(
        id: json["id"],
        userId: json["user_id"],
        chairman: json["chairman"],
        city: json["city"],
        address: json["address"],
        telp: json["telp"],
        image: json["image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "chairman": chairman,
        "city": city,
        "address": address,
        "telp": telp,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
