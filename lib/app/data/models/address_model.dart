import 'package:customer_app/app/data/models/user_model.dart';

class AddressModel {
  int? id;
  UserModel? userId;
  String? recipientsName;
  String? telp;
  String? addressLabel;
  String? city;
  String? completeAddress;
  String? noteForCourier;

  AddressModel({
    this.id,
    this.userId,
    this.recipientsName,
    this.telp,
    this.addressLabel,
    this.city,
    this.completeAddress,
    this.noteForCourier,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'] != null
        ? new UserModel.fromJson(json['user_id'])
        : null;
    recipientsName = json['recipients_name'];
    telp = json['telp'];
    addressLabel = json['address_label'];
    city = json['city'];
    completeAddress = json['complete_address'];
    noteForCourier = json['note_for_courier'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (this.userId != null) {
      data['user_id'] = this.userId!.toJson();
    }
    data['recipients_name'] = recipientsName;
    data['telp'] = telp;
    data['address_label'] = addressLabel;
    data['complete_address'] = completeAddress;
    data['note_for_courier'] = noteForCourier;

    return data;
  }
}
