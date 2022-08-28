// class City {
//   String? cityId;
//   String? provinceId;
//   String? province;
//   String? type;
//   String? cityName;
//   String? postalCode;

//   City({
//     this.cityId,
//     this.provinceId,
//     this.province,
//     this.type,
//     this.cityName,
//     this.postalCode,
//   });

//   City.fromJson(Map<String, dynamic> json) {
//     cityId = json['city_id'];
//     provinceId = json['province_id'];
//     province = json['province'];
//     type = json['type'];
//     cityName = json['city_name'];
//     postalCode = json['postal_code'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['city_id'] = cityId;
//     data['province_id'] = provinceId;
//     data['province'] = province;
//     data['type'] = type;
//     data['city_name'] = cityName;
//     data['postal_code'] = postalCode;
//     return data;
//   }

//   static List<City> fromJsonList(List list) {
//     if (list.length == 0) return List<City>.empty();
//     return list.map((item) => City.fromJson(item)).toList();
//   }
// }

// To parse this JSON data, do
//
//     final city = cityFromJson(jsonString);

// To parse this JSON data, do
//
//     final city = cityFromJson(jsonString);

import 'dart:convert';

Village villageFromJson(String str) => Village.fromJson(json.decode(str));

String villageToJson(Village data) => json.encode(data.toJson());

class Village {
  Village({
    this.id,
    this.code,
    this.provinceCode,
    this.name,
    this.meta,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? code;
  String? provinceCode;
  String? name;
  Meta? meta;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Village.fromJson(Map<String, dynamic> json) => Village(
        id: json["id"],
        code: json["code"],
        provinceCode: json["province_code"],
        name: json["name"],
        meta: Meta.fromJson(json["meta"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "province_code": provinceCode,
        "name": name,
        "meta": meta!.toJson(),
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };

  static List<Village> fromJsonList(List list) {
    if (list.length == 0) return List<Village>.empty();
    return list.map((item) => Village.fromJson(item)).toList();
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
