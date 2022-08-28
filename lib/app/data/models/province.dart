// class Province {
//   String? provinceId;
//   String? province;

//   Province({this.provinceId, this.province});

//   Province.fromJson(Map<String, dynamic> json) {
//     provinceId = json['province_id'];
//     province = json['province'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['province_id'] = provinceId;
//     data['province'] = province;
//     return data;
//   }

//   static List<Province> fromJsonList(List list) {
//     if (list.length == 0) return List<Province>.empty();
//     return list.map((item) => Province.fromJson(item)).toList();
//   }
// }

// To parse this JSON data, do
//
//     final province = provinceFromJson(jsonString);

import 'dart:convert';

Province provinceFromJson(String str) => Province.fromJson(json.decode(str));

String provinceToJson(Province data) => json.encode(data.toJson());

class Province {
  Province({
    this.id,
    this.code,
    this.name,
    this.meta,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? code;
  String? name;
  Meta? meta;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Province.fromJson(Map<String, dynamic> json) => Province(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        meta: Meta.fromJson(json["meta"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "meta": meta!.toJson(),
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };

  static List<Province> fromJsonList(List list) {
    if (list.length == 0) return List<Province>.empty();
    return list.map((item) => Province.fromJson(item)).toList();
  }
}

class Meta {
  Meta({
    this.lat,
    this.long,
  });

  String? lat;
  String? long;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        lat: json["lat"],
        long: json["long"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "long": long,
      };
}
