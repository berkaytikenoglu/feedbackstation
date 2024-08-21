import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

class APIServices extends GetConnect {
  final String baseURL = "http://10.0.12.26/restapi/laravelapi/public/api/";
  final String userTOKEN;

  APIServices({required this.userTOKEN}) {
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

// Yeni Request ekleme
  Future<Map<String, dynamic>> addfeedbackrequest(
      {required Map<String, String> formData}) async {
    return await fetch('requests', method: 'POST', body: formData);
  }
//  Request listeleme

  Future<Map<String, dynamic>> getfeedbackrequest(
      {required Map<String, String> formData}) async {
    return await fetch('requests', method: 'GET', body: formData);
  }

  // Kullanıcıları getirme
  Future<Map<String, dynamic>> getUsers() async {
    return await fetch('users');
  }

  // Yeni kullanıcı ekleme
  Future<Map<String, dynamic>> addUser(
      {required Map<String, String> formData}) async {
    return await fetch('users', method: 'POST', body: formData);
  }

  // Yeni kullanıcı düzenleme
  Future<Map<String, dynamic>> editUser(
      {required int userID, required Map<String, String> formData}) async {
    return await fetch('users/$userID', method: 'PUT', body: formData);
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
      Response response;
      if (method == 'POST') {
        response = await post(
          endpoint,
          json.encode(body),
          headers: {
            'Authorization': 'Bearer $userTOKEN',
            'Content-Type': 'application/json'
          },
        );
      } else if (method == 'PUT') {
        response = await put(
          endpoint,
          json.encode(body),
          headers: {
            'Authorization': 'Bearer $userTOKEN',
            'Content-Type': 'application/json'
          },
        );
      } else {
        response = await get(
          endpoint,
          headers: {
            'Authorization': 'Bearer $userTOKEN',
            'Content-Type': 'application/json'
          },
        );
      }

      if (response.isOk) {
        return json.decode(response.bodyString.toString());
      } else {
        log("Status hatası: ${response.statusCode}");
        return _handleError(response.statusCode, response.bodyString);
      }
    } catch (e) {
      log("Hata: ${e.toString()}");
      return {
        'status': false,
        'message': 'Sunucuya bağlanılamadı: $e',
      };
    }
  }

  Map<String, dynamic> _handleError(int? statusCode, String? body) {
    return {
      'status': false,
      'message': 'Hata: $statusCode ${body ?? 'Bir hata oluştu'}',
    };
  }
}
