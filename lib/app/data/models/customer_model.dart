import 'package:customer_app/app/data/models/user_model.dart';

class CustomerModel {
  int? id;
  UserModel? userId;
  int? addressId;
  String? gender;
  String? birth;
  int? telp;
  String? image;

  CustomerModel({
    this.id,
    this.userId,
    this.addressId,
    this.gender,
    this.birth,
    this.telp,
    this.image,
  });

  CustomerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'] != null
        ? new UserModel.fromJson(json['user_id'])
        : null;
    addressId = json['address_id'];
    gender = json['gender'];
    birth = json['birth'];
    telp = json['telp'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    if (userId != null) {
      data['user_id'] = userId!.toJson();
    }
    data['address_id'] = addressId;
    data['gender'] = gender;
    data['birth'] = birth;
    data['telp'] = telp;
    data['image'] = image;
    return data;
  }
}
