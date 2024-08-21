import 'dart:developer';

import 'package:feedbackstation/app/data/models/adres_model.dart';
import 'package:feedbackstation/app/data/models/media_model.dart';
import 'package:feedbackstation/app/data/models/permission_model.dart';
import 'package:feedbackstation/app/data/models/user_model.dart';
import 'package:feedbackstation/app/services/API/api.dart';
import 'package:feedbackstation/app/utils/session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var tcconttroller = TextEditingController().obs;
  var adconttroller = TextEditingController().obs;
  var soyAdconttroller = TextEditingController().obs;
  var telnoconttroller = TextEditingController().obs;
  var parolaconttroller = TextEditingController().obs;
  var parola2conttroller = TextEditingController().obs;
  var mailconttroller = TextEditingController().obs;

  var kvkkcheck = false.obs;

  Future<void> register() async {
    final userApiService =
        APIServices(userTOKEN: AppSession.userTOKEN.toString());
    if (kvkkcheck.value == false ||
        adconttroller.value.text == "" ||
        soyAdconttroller.value.text == "" ||
        tcconttroller.value.text == "" ||
        telnoconttroller.value.text == "" ||
        mailconttroller.value.text == "") {
      Get.snackbar("HATA", "Tüm Alanlar Doldurulmalı Ve KVKK onaylanmalıdır");
    }

    if (tcconttroller.value.text.length != 11 ||
        telnoconttroller.value.text.length != 10) {
      Get.snackbar("HATA", "TC no veya Telefon numarası eksik veya hatalı");
    }
    Map<String, String> formData = {
      "tc_identity": tcconttroller.value.text,
      "email": mailconttroller.value.text,
      "firstname": adconttroller.value.text,
      "lastname": soyAdconttroller.value.text,
      "password": parolaconttroller.value.text,
      "phonenumber": telnoconttroller.value.text,
    };

    final Map<String, dynamic> getUsersResult =
        await userApiService.addUser(formData: formData);

    if (getUsersResult['status'] != true) {
      Get.snackbar(
        "Sistem",
        getUsersResult['message'].toString(),
        colorText: Colors.white,
        backgroundColor: Colors.black38,
      );
      return;
    }

    AppSession.user = User();
    var userInfo = getUsersResult['response']['user'];
    AppSession.userTOKEN =
        AppSession.userTOKEN = getUsersResult['response']['access_token'];
    AppSession.user = User(
      id: userInfo['id'],
      permission: PermissionModel(
        name: userInfo['permission']['name'],
        category: userInfo['permission']['category'],
        canShowAdminPanel:
            userInfo['permission']['canshowadminpanel'] == 1 ? true : false,
        canEditUser: userInfo['permission']['canedituser'] == 1 ? true : false,
        canDeleteUser: true,
        // canDeleteUser: element['permission']['candeleteuser'] == 1 ? true : false,
        canResponseRequest:
            userInfo['permission']['canresponserequest'] == 1 ? true : false,
        canUploadAvatar:
            userInfo['permission']['canuploadavatar'] == 1 ? true : false,
        canAddFeedbackCategory:
            userInfo['permission']['canaddfeedbackcategory'] == 1
                ? true
                : false,
        canDeleteFeedbackCategory:
            userInfo['permission']['candeletefeedbackcategory'] == 1
                ? true
                : false,
        canReportRequest:
            userInfo['permission']['canreportrequest'] == 1 ? true : false,
        canEditmyProfile:
            userInfo['permission']['caneditmyprofile'] == 1 ? true : false,
      ),
      displayname: userInfo["name"],
      email: userInfo["email"],
      firstname: userInfo["firstname"],
      lastname: userInfo["lastname"],
      phonenumber: userInfo["phonenumber"],
      serialNumber: userInfo["tc_identity"],
      avatar: Media(
        id: 0,
        type: MediaType.image,
        isLocal: false,
        bigUrl: userInfo["big_avatar"],
        normalUrl: userInfo["normal_avatar"],
        minUrl: userInfo["min_avatar"],
      ),
      gender: Gender.male,
      address: AddresModel(
        neighbourhood: "Mustafa Kemal Paşa Mahallesi",
        streetAvenue: "Sahil Caddesi",
        streetAvenueAlley: "",
        // insideDoor: "4",
        // outDoor: "441",
        neighborhoodDirections: "Bimin üstündeyiz",
      ),
    );

    Get.toNamed("/home");
  }

  @override
  void onInit() {
    super.onInit();

    log("Anasayfaya Hoşgeldiniz");
  }

  @override
  void onClose() {
    super.onClose();

    log("Anasayfaya Çıkıtnız");
  }
}
