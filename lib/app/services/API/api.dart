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

// Yeni Address ekleme
  Future<Map<String, dynamic>> addAddress({
    required int userID,
    required String description,
    required String insidedoor,
    required String outdoor,
    required String street,
    required String neighbourhood,
    required String city,
    required String province,
    required String country,
    required String postalcode,
  }) async {
    Map<String, String> formData = {
      "user_id": userID.toString(),
      "description": description,
      "insidedoor": insidedoor,
      "outdoor": outdoor,
      "street": street,
      "neighbourhood": neighbourhood,
      "city": city,
      "province": province,
      "country": country,
      "postalcode": postalcode,
    };
    return await fetch('address', method: 'POST', body: formData);
  }

// Adresleri listele
  Future<Map<String, dynamic>> getAddress() async {
    return await fetch('address', method: 'GET', body: null);
  }

// Yeni Request ekleme
  Future<Map<String, dynamic>> addfeedbackrequest({
    required String addressDescription,
    required String addressInsidedoor,
    required String addressOutdoor,
    required String addressStreet,
    required String addressNeighbourhood,
    required String addressProvince,
    required String addressPostalcode,
    required String addressCountry,
    required String addressCity,
    required int categoryID,
    required int userID,
    required String description,
    required String subject,
  }) async {
    Map<String, dynamic> formData = {
      "address_description": addressDescription,
      "address_insidedoor": addressInsidedoor,
      "address_outdoor": addressOutdoor,
      "address_street": addressStreet,
      "address_neighbourhood": addressNeighbourhood,
      "address_province": addressProvince,
      "address_country": addressCountry,
      "address_city": addressCity,
      "address_postal_code": addressPostalcode,
      "category_id": categoryID.toString(),
      "user_id": userID.toString(),
      "description": description,
      "subject": subject,
    };
    return await fetch('requests', method: 'POST', body: formData);
  }
//  Request listeleme

  Future<Map<String, dynamic>> getfeedbackrequest() async {
    return await fetch('requests', method: 'GET', body: null);
  }

  // Kullanıcıları getirme
  Future<Map<String, dynamic>> getUsers() async {
    return await fetch('users');
  }

  // Yeni kullanıcı ekleme
  Future<Map<String, dynamic>> addUser({
    required String tcIdentity,
    required String email,
    required String firstname,
    required String lastname,
    required String password,
    required String phonenumber,
    String? bigAvatar,
    String? normalAvatar,
    String? minAvatar,
  }) async {
    Map<String, String> formData = {
      "tc_identity": tcIdentity,
      "email": email,
      "firstname": firstname,
      "lastname": lastname,
      "password": password,
      "phonenumber": phonenumber,
    };

    if (bigAvatar != null) {
      formData["big_avatar"] = bigAvatar;
    }
    if (normalAvatar != null) {
      formData["normal_avatar"] = normalAvatar;
    }
    if (minAvatar != null) {
      formData["min_avatar"] = minAvatar;
    }

    return await fetch('users', method: 'POST', body: formData);
  }

  // Yeni kullanıcı düzenleme
  Future<Map<String, dynamic>> editUser(
      {required int userID, required Map<String, String> formData}) async {
    return await fetch('users/$userID', method: 'PUT', body: formData);
  }

  // Giriş Yapma
  Future<Map<String, dynamic>> login({
    required String tcIdentity,
    required String password,
  }) async {
    Map<String, String> formData = {
      "tc_identity": tcIdentity,
      "password": password,
    };
    return await fetch('login', method: 'POST', body: formData);
  }

  // Giriş Yapma
  Future<Map<String, dynamic>> logout() async {
    return await fetch('users', method: 'POST', body: null);
  }

  //////////////////////////////////////////////////////////////////////////////

  Future<Map<String, dynamic>> fetch(String endpoint,
      {String method = 'GET', Map<String, dynamic>? body}) async {
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
