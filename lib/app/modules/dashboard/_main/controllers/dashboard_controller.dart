import 'dart:convert';
import 'dart:developer';

import 'package:feedbackstation/app/data/models/media_model.dart';
import 'package:feedbackstation/app/data/models/permission_model.dart';
import 'package:feedbackstation/app/data/models/user_model.dart';
import 'package:feedbackstation/app/services/API/api.dart';
import 'package:feedbackstation/app/utils/applist.dart';
import 'package:feedbackstation/app/utils/session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardAdminController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var fetchuserStatus = false.obs;
  var userList = AppList.userList.obs;
  @override
  void onInit() {
    super.onInit();

    fetchUser();
    log("Üyeler veritabanından çekiliyor");
  }

  @override
  void onClose() {
    //
    super.onClose();
  }

  Future<void> fetchUser() async {
    final userApiService =
        APIServices(userTOKEN: AppSession.userTOKEN.toString());

    fetchuserStatus.value = true;
    final Map<String, dynamic> getUsersResult = await userApiService.getUsers();
    fetchuserStatus.value = false;

    if (getUsersResult['status'] != true) {
      Get.snackbar(
        "Sistem",
        getUsersResult['message'].toString(),
        colorText: Colors.white,
        backgroundColor: Colors.black38,
      );
      return;
    }
    userList.clear();
    for (var element in getUsersResult['response']) {
      element['permission']['canshowadminpanel'];
      log(element['permission']['canedituser'].toString());
      log(element['permission']['canresponserequest'].toString());
      log(element['permission']['canuploadavatar'].toString());
      log(element['permission']['canaddfeedbackcategory'].toString());
      log(element['permission']['candeletefeedbackcategory'].toString());
      element['permission']['candeletefeedbackcategory'] == 1 ? true : false;
      element['permission']['canreportrequest'] == 1 ? true : false;
      element['permission']['caneditmyprofile'] == 1 ? true : false;
      userList.add(
        User(
          id: element['id'],
          email: element['email'].toString(),
          avatar: Media(
            id: 0,
            type: MediaType.image,
            bigUrl: element['big_avatar'].toString(),
            normalUrl: element['normal_avatar'].toString(),
            minUrl: element['min_avatar'].toString(),
            isLocal: false,
          ),
          displayname: element['name'].toString(),
          firstname: element['firstname'].toString(),
          lastname: element['lastname'].toString(),
          serialNumber: element['tc_identity'].toString(),
          phonenumber: element['phonenumber'].toString(),
          permission: PermissionModel(
            name: element['permission']['name'],
            category: element['permission']['category'],
            canShowAdminPanel:
                element['permission']['canshowadminpanel'] == 1 ? true : false,
            canEditUser:
                element['permission']['canedituser'] == 1 ? true : false,
            canDeleteUser: true,
            canResponseRequest:
                element['permission']['canresponserequest'] == 1 ? true : false,
            canResponseRequestlist: element['permission']
                        ['canresponserequest'] ==
                    null
                ? null
                : json.decode(element['permission']['canresponserequestlist']),
            canUploaduserAvatar:
                element['permission']['canuploaduseravatar'] == 1
                    ? true
                    : false,
            canAddFeedbackCategory:
                element['permission']['canaddfeedbackcategory'] == 1
                    ? true
                    : false,
            canDeleteFeedbackCategory:
                element['permission']['candeletefeedbackcategory'] == 1
                    ? true
                    : false,
            canReportRequest:
                element['permission']['canreportrequest'] == 1 ? true : false,
            canEditmyProfile:
                element['permission']['caneditmyprofile'] == 1 ? true : false,
            canDeletemyProfile:
                element['permission']['candeletemyprofile'] == 1 ? true : false,
            canUploadAvatarmyProfile:
                element['permission']['canuploaduseravatarmyprofile'] == 1
                    ? true
                    : false,
          ),
        ),
      );
    }
  }
}
