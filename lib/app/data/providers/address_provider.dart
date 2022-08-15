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
    int provinsiId,
    int kotaId,
    int postalCode,
    int mainAddress,
    String noteForCourier,
    String token,
  ) async {
    final response = await post(url, {
      "user_id": userId,
      "recipients_name": recipientsName,
      "telp": telp,
      "address_label": addressLabel,
      "complete_address": completeAddress,
      "provinsi_id": provinsiId,
      "kota_id": kotaId,
      "postal_code": postalCode,
      "main_address": mainAddress,
      "note_for_courier": noteForCourier,
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<dynamic> getData(int userId, int page, String token) async {
    final response = await get('$url/user_id/$userId?page=$page', headers: {
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
    int provinsiId,
    int kotaId,
    int postalCode,
    int mainAddress,
    String noteForCourier,
    String token,
  ) async {
    final response = await put(url + '/$id', {
      "id": id,
      "recipients_name": recipientsName,
      "telp": telp,
      "address_label": addressLabel,
      "complete_address": completeAddress,
      "provinsi_id": provinsiId,
      "kota_id": kotaId,
      "postal_code": postalCode,
      "main_address": mainAddress,
      "note_for_courier": noteForCourier,
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<dynamic> updateMainAddress(
    int id,
    int userId,
    int mainAddress,
    String token,
  ) async {
    final response = await put(url + '/main_address/$id', {
      "id": id,
      "user_id": userId,
      "main_address": mainAddress,
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
