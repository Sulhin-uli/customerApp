import 'package:customer_app/app/data/models/user_model.dart';

class AddressModel {
  int? id;
  UserModel? userId;
  String? recipientsName;
  String? telp;
  String? addressLabel;
  String? city;
  int? postalCode;
  int? mainAddress;
  String? completeAddress;
  String? noteForCourier;

  AddressModel({
    this.id,
    this.userId,
    this.recipientsName,
    this.telp,
    this.addressLabel,
    this.city,
    this.postalCode,
    this.mainAddress,
    this.completeAddress,
    this.noteForCourier,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId =
        json['user_id'] != null ? UserModel.fromJson(json['user_id']) : null;
    recipientsName = json['recipients_name'];
    telp = json['telp'];
    addressLabel = json['address_label'];
    city = json['city'];
    postalCode = json['postal_code'];
    mainAddress = json['main_address'];
    completeAddress = json['complete_address'];
    noteForCourier = json['note_for_courier'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (userId != null) {
      data['user_id'] = userId!.toJson();
    }
    data['recipients_name'] = recipientsName;
    data['telp'] = telp;
    data['postal_code'] = postalCode;
    data['main_address'] = mainAddress;
    data['address_label'] = addressLabel;
    data['complete_address'] = completeAddress;
    data['note_for_courier'] = noteForCourier;

    return data;
  }
}
