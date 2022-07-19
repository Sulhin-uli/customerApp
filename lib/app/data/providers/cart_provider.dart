import 'package:customer_app/app/utils/base_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CartProvider extends GetConnect {
  @override
  String url = baseUrl + "cart";

  Future<dynamic> getData(int userId, String token) async {
    final response = await get('$url/user_id/$userId', headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<void> updateQty(int id, int productQty, String? token) async {
    final response = await put('$url/qty/$id', {
      "product_qty": productQty,
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<dynamic> postData(int? userId, int? productId, int? productQty,
      int? sessionId, String? token) async {
    final response = await post(url, {
      "user_id": userId,
      "product_id": productId,
      "product_qty": productQty,
      "session_id": sessionId,
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<dynamic> postDataOrder(
      int? userId, int totalHarga, List<int> productId, String? token) async {
    final response = await post('$url/shipment/place-order', {
      "user_id": userId,
      "total_hraga": totalHarga,
      "product_id": productId,
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

  // Future<dynamic> postDataOrder(
  //     Map<String, String> body, String filepath, String token) async {
  //   // Map<String, String> headers = {
  //   //   'Content-Type': 'multipart/form-data',
  //   //   'Authorization': 'Bearer $token',
  //   // };
  //   // var request = http.MultipartRequest('POST', Uri.parse(url))
  //   //   ..fields.addAll(body)
  //   //   ..headers.addAll(headers)
  //   //   ..files.add(await http.MultipartFile.fromPath('file', filepath));
  //   // final response = await request.send();
  //   // var responsed = await http.Response.fromStream(response);
  //   // final responseData = json.decode(responsed.body);
  //   // return responseData;
  // }
}
