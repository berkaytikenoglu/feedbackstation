import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

class APIServices extends GetConnect {
  final String baseURL = "http://10.0.12.26/restapi/laravelapi/public/api/";
  String userName = "";
  String userTOKEN = "";

  APIServices() {
    httpClient.baseUrl = baseURL;
    log("API INITALIZED : $baseURL");
  }

  void setUsername(userName) {
    userName = userName;
  }

  void setuserTOKEN(userTOKEN) {
    userTOKEN = userTOKEN;
  }

  //////////////////////////////////USER////////////////////////////////////////////

  // Kullanıcıları getirme
  Future<Map<String, dynamic>> getUsers() async {
    return await fetch('users');
  }

  // Yeni kullanıcı ekleme
  Future<Map<String, dynamic>> addUser(
      {required Map<String, String> formData}) async {
    return await fetch('users', method: 'POST', body: formData);
  }

  // Giriş Yapma
  Future<Map<String, dynamic>> login(
      {required Map<String, String> formData}) async {
    return await fetch('login', method: 'POST', body: formData);
  }

  // Giriş Yapma
  Future<Map<String, dynamic>> logout(
      {required Map<String, String> formData}) async {
    return await fetch('users', method: 'POST', body: formData);
  }

  //////////////////////////////////////////////////////////////////////////////

  Future<Map<String, dynamic>> fetch(String endpoint,
      {String method = 'GET', Map<String, String>? body}) async {
    try {
      log("Tam URL: ${httpClient.baseUrl! + endpoint}");
      final response = method == 'POST'
          ? await post(endpoint, json.encode(body),
              headers: {'Content-Type': 'application/json'})
          : await get(endpoint);

      // log(response.bodyString.toString());
      if (response.isOk) {
        return json.decode(response.bodyString.toString());
      } else {
        log("Status hatası: ${response.statusCode}");
        return _handleError(response.statusCode, response.bodyString);
      }
    } catch (e) {
      log("Hata: ${e.toString()}");
      return {
        'status': "false",
        'message': 'Sunucuya bağlanılamadı: $e',
      };
    }
  }

  Map<String, String> _handleError(int? statusCode, String? body) {
    return {
      'status': "false",
      'message': 'Hata: $statusCode ${body ?? 'Bir hata oluştu'}',
    };
  }
}
