// import 'package:customer_app/app/data/models/user_model.dart';

// class CustomerModel {
//   int? id;
//   UserModel? userId;
//   int? addressId;
//   String? gender;
//   String? birth;
//   int? telp;
//   String? image;

//   CustomerModel({
//     this.id,
//     this.userId,
//     this.addressId,
//     this.gender,
//     this.birth,
//     this.telp,
//     this.image,
//   });

//   CustomerModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId =
//         json['user_id'] != null ? UserModel.fromJson(json['user_id']) : null;
//     addressId = json['address_id'];
//     gender = json['gender'];
//     birth = json['birth'];
//     telp = json['telp'];
//     image = json['image'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     if (userId != null) {
//       data['user_id'] = userId!.toJson();
//     }
//     data['address_id'] = addressId;
//     data['gender'] = gender;
//     data['birth'] = birth;
//     data['telp'] = telp;
//     data['image'] = image;
//     return data;
//   }
// }

// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);

import 'dart:convert';

CustomerModel customerModelFromJson(String str) =>
    CustomerModel.fromJson(json.decode(str));

String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
  CustomerModel({
    this.id,
    this.userId,
    this.addressId,
    this.gender,
    this.birth,
    this.telp,
    this.image,
  });

  int? id;
  UserId? userId;
  dynamic addressId;
  dynamic gender;
  dynamic birth;
  dynamic telp;
  dynamic image;

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        id: json["id"],
        userId: UserId.fromJson(json["user_id"]),
        addressId: json["address_id"],
        gender: json["gender"],
        birth: json["birth"],
        telp: json["telp"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId!.toJson(),
        "address_id": addressId,
        "gender": gender,
        "birth": birth,
        "telp": telp,
        "image": image,
      };
}

class UserId {
  UserId({
    this.id,
    this.name,
    this.email,
  });

  int? id;
  String? name;
  String? email;

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["id"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
      };
}
