import 'package:customer_app/app/utils/base_url.dart';
import 'package:get/get.dart';

class AddressProvider extends GetConnect {
  String url = baseUrl + "address";

  Future<dynamic> postData(
    int userId,
    String recipientsName,
    String telp,
    String addressLabel,
    String completeAddress,
    String city,
    String noteForCourier,
    String token,
  ) async {
    final response = await post(url, {
      "user_id": userId,
      "recipients_name": recipientsName,
      "telp": telp,
      "address_label": addressLabel,
      "complete_address": completeAddress,
      "city": city,
      "note_for_courier": noteForCourier,
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<dynamic> getData(int userId, String token) async {
    final response = await get('$url/user_id/$userId', headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<void> updateData(
    int id,
    String recipientsName,
    String telp,
    String addressLabel,
    String completeAddress,
    String city,
    String noteForCourier,
    String token,
  ) async {
    final response = await put(url + '/$id', {
      "id": id,
      "recipients_name": recipientsName,
      "telp": telp,
      "address_label": addressLabel,
      "complete_address": completeAddress,
      "city": city,
      "note_for_courier": noteForCourier,
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<void> deleteData(
    int? id,
    String token,
  ) async =>
      await delete(url + '/$id', headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
}
