// To parse this JSON data, do
//
//     final toko = tokoFromJson(jsonString);

import 'dart:convert';

class RadioCancel {
  RadioCancel({
    this.id,
    this.chairman,
  });

  int? id;
  String? chairman;
}
