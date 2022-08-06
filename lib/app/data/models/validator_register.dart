// To parse this JSON data, do
//
//     final validatorRegister = validatorRegisterFromJson(jsonString);

import 'dart:convert';

ValidatorRegister validatorRegisterFromJson(String str) =>
    ValidatorRegister.fromJson(json.decode(str));

String validatorRegisterToJson(ValidatorRegister data) =>
    json.encode(data.toJson());

class ValidatorRegister {
  ValidatorRegister({
    this.status,
    this.messages,
  });

  int? status;
  Messages? messages;

  factory ValidatorRegister.fromJson(Map<String, dynamic> json) =>
      ValidatorRegister(
        status: json["status"],
        messages: Messages.fromJson(json["messages"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "messages": messages!.toJson(),
      };
}

class Messages {
  Messages({
    this.name,
    this.email,
    this.password,
    this.cpassword,
  });

  List<String>? name;
  List<String>? email;
  List<String>? password;
  List<String>? cpassword;

  factory Messages.fromJson(Map<String, dynamic> json) => Messages(
        name: List<String>.from(json["name"].map((x) => x)),
        email: List<String>.from(json["email"].map((x) => x)),
        password: List<String>.from(json["password"].map((x) => x)),
        cpassword: List<String>.from(json["cpassword"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": List<dynamic>.from(name!.map((x) => x)),
        "email": List<dynamic>.from(email!.map((x) => x)),
        "password": List<dynamic>.from(password!.map((x) => x)),
        "cpassword": List<dynamic>.from(cpassword!.map((x) => x)),
      };
}
