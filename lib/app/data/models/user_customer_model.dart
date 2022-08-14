// To parse this JSON data, do
//
//     final userCustomer = userCustomerFromJson(jsonString);

import 'dart:convert';

UserCustomer userCustomerFromJson(String str) =>
    UserCustomer.fromJson(json.decode(str));

String userCustomerToJson(UserCustomer data) => json.encode(data.toJson());

class UserCustomer {
  UserCustomer({
    this.users,
    this.customers,
    this.token,
  });

  Users? users;
  Customers? customers;
  String? token;

  factory UserCustomer.fromJson(Map<String, dynamic> json) => UserCustomer(
        users: Users.fromJson(json["users"]),
        customers: Customers.fromJson(json["customers"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "users": users!.toJson(),
        "customers": customers!.toJson(),
        "token": token,
      };
}

class Customers {
  Customers({
    this.id,
    this.userId,
    this.gender,
    this.birth,
    this.telp,
    this.image,
    this.isEmailVerified,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  dynamic gender;
  dynamic birth;
  dynamic telp;
  dynamic image;
  int? isEmailVerified;
  dynamic createdAt;
  dynamic updatedAt;

  factory Customers.fromJson(Map<String, dynamic> json) => Customers(
        id: json["id"],
        userId: json["user_id"],
        gender: json["gender"],
        birth: json["birth"],
        telp: json["telp"],
        image: json["image"],
        isEmailVerified: json["is_email_verified"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "gender": gender,
        "birth": birth,
        "telp": telp,
        "image": image,
        "is_email_verified": isEmailVerified,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Users {
  Users({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.token,
    this.tokenExpire,
    this.fcmToken,
    this.createdAt,
    this.updatedAt,
    this.roles,
  });

  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  dynamic token;
  dynamic tokenExpire;
  dynamic fcmToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Role>? roles;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        token: json["token"],
        tokenExpire: json["token_expire"],
        fcmToken: json["fcm_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "token": token,
        "token_expire": tokenExpire,
        "fcm_token": fcmToken,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "roles": List<dynamic>.from(roles!.map((x) => x.toJson())),
      };
}

class Role {
  Role({
    this.id,
    this.name,
    this.guardName,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  int? id;
  String? name;
  String? guardName;
  DateTime? createdAt;
  DateTime? updatedAt;
  Pivot? pivot;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        guardName: json["guard_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "guard_name": guardName,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "pivot": pivot!.toJson(),
      };
}

class Pivot {
  Pivot({
    this.modelId,
    this.roleId,
    this.modelType,
  });

  int? modelId;
  int? roleId;
  String? modelType;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        modelId: json["model_id"],
        roleId: json["role_id"],
        modelType: json["model_type"],
      );

  Map<String, dynamic> toJson() => {
        "model_id": modelId,
        "role_id": roleId,
        "model_type": modelType,
      };
}
