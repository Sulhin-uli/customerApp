// import 'package:customer_app/app/data/models/user_model.dart';

// class AddressModel {
//   int? id;
//   UserModel? userId;
//   String? recipientsName;
//   String? telp;
//   String? addressLabel;
//   int? provinsiId;
//   int? kotaId;
//   int? postalCode;
//   int? mainAddress;
//   String? completeAddress;
//   String? noteForCourier;

//   AddressModel({
//     this.id,
//     this.userId,
//     this.recipientsName,
//     this.telp,
//     this.addressLabel,
//     this.provinsiId,
//     this.kotaId,
//     this.postalCode,
//     this.mainAddress,
//     this.completeAddress,
//     this.noteForCourier,
//   });

//   AddressModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId =
//         json['user_id'] != null ? UserModel.fromJson(json['user_id']) : null;
//     recipientsName = json['recipients_name'];
//     telp = json['telp'];
//     addressLabel = json['address_label'];
//     // city = json['city'];
//     postalCode = json['postal_code'];
//     mainAddress = json['main_address'];
//     completeAddress = json['complete_address'];
//     noteForCourier = json['note_for_courier'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     if (userId != null) {
//       data['user_id'] = userId!.toJson();
//     }
//     data['recipients_name'] = recipientsName;
//     data['telp'] = telp;
//     data['postal_code'] = postalCode;
//     data['main_address'] = mainAddress;
//     data['address_label'] = addressLabel;
//     data['complete_address'] = completeAddress;
//     data['note_for_courier'] = noteForCourier;

//     return data;
//   }
// }

// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

AddressModel addressModelFromJson(String str) =>
    AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  AddressModel({
    this.id,
    this.userId,
    this.recipientsName,
    this.telp,
    this.addressLabel,
    this.provinsiId,
    this.kotaId,
    this.postalCode,
    this.mainAddress,
    this.completeAddress,
    this.noteForCourier,
  });

  int? id;
  UserId? userId;
  String? recipientsName;
  String? telp;
  String? addressLabel;
  dynamic provinsiId;
  dynamic kotaId;
  int? postalCode;
  int? mainAddress;
  String? completeAddress;
  String? noteForCourier;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json["id"],
        userId: UserId.fromJson(json["user_id"]),
        recipientsName: json["recipients_name"],
        telp: json["telp"],
        addressLabel: json["address_label"],
        provinsiId: json["provinsi_id"],
        kotaId: json["kota_id"],
        postalCode: json["postal_code"],
        mainAddress: json["main_address"],
        completeAddress: json["complete_address"],
        noteForCourier: json["note_for_courier"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId!.toJson(),
        "recipients_name": recipientsName,
        "telp": telp,
        "address_label": addressLabel,
        "provinsi_id": provinsiId,
        "kota_id": kotaId,
        "postal_code": postalCode,
        "main_address": mainAddress,
        "complete_address": completeAddress,
        "note_for_courier": noteForCourier,
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
