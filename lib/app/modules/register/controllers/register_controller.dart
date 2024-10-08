import 'dart:developer';

import 'package:feedbackstation/app/data/models/addres_model.dart';
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

    if (GetUtils.isEmail(mailconttroller.value.text)) {
      Get.snackbar(
        "HATA",
        "Geçersiz e-posta adresi girdiniz!",
      );
      return;
    }
    if (kvkkcheck.value == false ||
        adconttroller.value.text == "" ||
        soyAdconttroller.value.text == "" ||
        tcconttroller.value.text == "" ||
        telnoconttroller.value.text == "" ||
        mailconttroller.value.text == "" ||
        parolaconttroller.value.text == "" ||
        parola2conttroller.value.text == "" ||
        parolaconttroller.value.text != parola2conttroller.value.text) {
      Get.snackbar(
        "HATA",
        "Tüm Alanlar  Doğru Şekilde Doldurulmalı Ve KVKK onaylanmalıdır",
      );

      return;
    }

    if (tcconttroller.value.text.length != 11 ||
        telnoconttroller.value.text.length != 10) {
      Get.snackbar(
        "HATA",
        "TC no veya Telefon numarası eksik veya hatalı",
      );

      return;
    }

    final Map<String, dynamic> getUsersResult = await userApiService.addUser(
      bigAvatar: "",
      normalAvatar: "",
      minAvatar: "",
      email: mailconttroller.value.text,
      firstname: adconttroller.value.text,
      lastname: soyAdconttroller.value.text,
      password: parolaconttroller.value.text,
      phonenumber: telnoconttroller.value.text,
      tcIdentity: tcconttroller.value.text,
    );

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
        canResponseRequest:
            userInfo['permission']['canresponserequest'] == 1 ? true : false,
        canResponseRequestlist: userInfo['permission']
            ['canResponseRequestlist'],
        canUploaduserAvatar:
            userInfo['permission']['canuploaduseravatar'] == 1 ? true : false,
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
        canDeletemyProfile:
            userInfo['permission']['candeletemyprofile'] == 1 ? true : false,
        canUploadAvatarmyProfile:
            userInfo['permission']['canuploaduseravatarmyprofile'] == 1
                ? true
                : false,
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
        street: "Sahil Caddesi",
        insidedoor: "4",
        outdoor: "441",
        description: "Bimin üstündeyiz",
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
