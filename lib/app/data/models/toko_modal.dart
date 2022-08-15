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
    this.provinceId,
    this.cityId,
    this.districtId,
    this.villageId,
    this.chairman,
    this.street,
    this.number,
    this.phone,
    this.image,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  dynamic provinceId;
  dynamic cityId;
  dynamic districtId;
  dynamic villageId;
  String? chairman;
  dynamic street;
  dynamic number;
  dynamic phone;
  dynamic image;
  int? isVerified;
  dynamic createdAt;
  dynamic updatedAt;

  factory Toko.fromJson(Map<String, dynamic> json) => Toko(
        id: json["id"],
        userId: json["user_id"],
        provinceId: json["province_id"],
        cityId: json["city_id"],
        districtId: json["district_id"],
        villageId: json["village_id"],
        chairman: json["chairman"],
        street: json["street"],
        number: json["number"],
        phone: json["phone"],
        image: json["image"],
        isVerified: json["is_verified"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "province_id": provinceId,
        "city_id": cityId,
        "district_id": districtId,
        "village_id": villageId,
        "chairman": chairman,
        "street": street,
        "number": number,
        "phone": phone,
        "image": image,
        "is_verified": isVerified,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
