import 'dart:convert';
import 'dart:developer' as ll;
import 'dart:math';

import 'package:feedbackstation/app/data/models/addres_model.dart';
import 'package:feedbackstation/app/data/models/feedbacks_category_model.dart';
import 'package:feedbackstation/app/data/models/permission_model.dart';
import 'package:feedbackstation/app/data/models/request_model.dart';
import 'package:feedbackstation/app/data/models/status_model.dart';
import 'package:feedbackstation/app/data/models/user_model.dart';
import 'package:feedbackstation/app/data/providers/user_provider.dart';
import 'package:feedbackstation/app/services/API/api.dart';

import 'package:feedbackstation/app/utils/applist.dart';
import 'package:feedbackstation/app/utils/session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartingpageController extends GetxController {
  Future<void> startingfunctions() async {
    // requestsListrefresh();
    // ---- Rastgele internet kullanıcıları çek

    fetchcategoryList();
    fetchpermissionsList();
    await fetchUserRandom();
    // ----
    // randomInfoRequestFillCategory(FeedbackCategory.complaint);
    // randomInfoRequestFillCategory(FeedbackCategory.informationRequest);
    // randomInfoRequestFillCategory(FeedbackCategory.report);
    // randomInfoRequestFillCategory(FeedbackCategory.thanks);
    // randomInfoRequestFillCategory(FeedbackCategory.request);
    // randomInfoRequestFillCategory(FeedbackCategory.projectStatement);

    // ----
  }

  Color colorFromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceAll('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  IconData fromString(String iconName) {
    switch (iconName.toLowerCase()) {
      case 'home':
        return Icons.home;
      case 'star':
        return Icons.star;
      case 'settings':
        return Icons.settings;
      case 'info':
        return Icons.info;
      case 'assignment':
        return Icons.assignment;
      case 'error':
        return Icons.error;
      case 'engineering':
        return Icons.engineering;
      case 'search':
        return Icons.search;

      case 'report':
        return Icons.report;

      case 'emoji_emotions':
        return Icons.emoji_emotions;

      default:
        return Icons.help; // Varsayılan ikon.
    }
  }

  fetchpermissionsList() async {
    final apiService = APIServices(
      userTOKEN: AppSession.userTOKEN.toString(),
    );
    //controller.loginstatus.value = true;
    final Map<String, dynamic> getUsersResult =
        await apiService.getPermissions();
    //controller.loginstatus.value = false;

    if (getUsersResult['status'] != true) {
      Get.snackbar(
        "Sistem",
        getUsersResult['message'].toString(),
        colorText: Colors.white,
        backgroundColor: Colors.black38,
      );
      return;
    }

    for (var element in getUsersResult['response']) {
      AppList.permissionsList.add(
        PermissionModel(
          name: element['name'],
          category: element['category'],
          canShowAdminPanel: element['canshowadminpanel'] == 1 ? true : false,
          canEditUser: element['canedituser'] == 1 ? true : false,
          canDeleteUser: element['candeleteuser'] == 1 ? true : false,
          canResponseRequest: element['canresponserequest'] == 1 ? true : false,
          canResponseRequestlist: element['canresponserequestlist'] == null
              ? null
              : json.decode(element['canresponserequestlist']),
          canUploaduserAvatar:
              element['canuploaduseravatar'] == 1 ? true : false,
          canAddFeedbackCategory:
              element['canaddfeedbackcategory'] == 1 ? true : false,
          canDeleteFeedbackCategory:
              element['candeletefeedbackcategory'] == 1 ? true : false,
          canReportRequest: element['canreportrequest'] == 1 ? true : false,
          canEditmyProfile: element['caneditmyprofile'] == 1 ? true : false,
          canDeletemyProfile: element['candeletemyprofile'] == 1 ? true : false,
          canUploadAvatarmyProfile:
              element['canuploaduseravatarmyprofile'] == 1 ? true : false,
        ),
      );
    }
  }

  Future<void> fetchcategoryList() async {
    final apiService = APIServices(
      userTOKEN: AppSession.userTOKEN.toString(),
    );

    //controller.loginstatus.value = true;
    final Map<String, dynamic> getUsersResult =
        await apiService.getCategories();
    //controller.loginstatus.value = false;

    if (getUsersResult['status'] != true) {
      Get.snackbar(
        "Sistem",
        getUsersResult['message'].toString(),
        colorText: Colors.white,
        backgroundColor: Colors.black38,
      );
      return;
    }
    for (var element in getUsersResult['response']) {
      AppList.requestcategoriesList.add(
        FeedbacksCategoryModel(
          id: element['id'],
          name: element['name'],
          description: element['description'],
          color: colorFromHex(element['color']),
          icon: fromString(element['icon']),
        ),
      );
    }
  }

  String generate11DigitNumber() {
    String digital11 = "";
    for (var i = 0; i < 11; i++) {
      digital11 += Random().nextInt(10).toString();
    }

    return digital11;
  }

  String generate10DigitNumber() {
    String digital10 = "537";
    for (var i = 0; i < 7; i++) {
      digital10 += Random().nextInt(10).toString();
    }

    return digital10;
  }

  Future<void> fetchUserRandom() async {
    ll.log("Rastgele Üyeler Çekiliyor...");

    for (var i = 0; i < 10; i++) {
      List<User> aa = await UserProvider().fetchRandomUsers();
      for (User element in aa) {
        element.permission = PermissionModel(
          name: "Müdür Yardımcısı",
          category: "Bilgi İşlem",
          canAddFeedbackCategory: false,
          canDeleteFeedbackCategory: false,
          canDeleteUser: false,
          canEditUser: false,
          canEditmyProfile: false,
          canReportRequest: false,
          canResponseRequestlist: null,
          canResponseRequest: false,
          canShowAdminPanel: false,
          canUploaduserAvatar: false,
          canDeletemyProfile: false,
          canUploadAvatarmyProfile: false,
        );
        AppList.userList.add(element);

        //--Veritabanına Kayıt Et
        final userApiService =
            APIServices(userTOKEN: AppSession.userTOKEN.toString());

        await userApiService.addUser(
          email: element.email.toString(),
          firstname: element.firstname.toString(),
          lastname: element.lastname.toString(),
          password: "12345678",
          phonenumber: generate10DigitNumber(),
          tcIdentity: generate11DigitNumber(),
          bigAvatar: element.avatar!.bigUrl.toString(),
          normalAvatar: element.avatar!.normalUrl.toString(),
          minAvatar: element.avatar!.minUrl.toString(),
        );
      }
      //--Veritabanına Kayıt Et
    }
    ll.log("Rastgele Üyeler Getirildi.");
  }

  void randomInfoRequestFillCategory(FeedbacksCategoryModel category) {
    int rndm = Random().nextInt(50000);

    for (var i = 0; i < rndm; i++) {
      final randomIndex = Random().nextInt(AppList.userList.length);
      final User randomUser = AppList.userList[randomIndex];

      DateTime datetime = DateTime.now();

      int rndmonth = Random().nextInt(12);
      int rndday = Random().nextInt(31);
      int rndhour = Random().nextInt(24);
      int rndmminutes = Random().nextInt(60);

      DateTime newdatetime =
          DateTime(datetime.year, rndmonth, rndday, rndhour, rndmminutes);

      final randomAppStatusIndex = Random().nextInt(AppStatus.values.length);
      final AppStatus randomAppStatus = AppStatus.values[randomAppStatusIndex];

      final randomFeedbackStatusIndex =
          Random().nextInt(FeedbackStatus.values.length);
      final FeedbackStatus randomFeedbackStatus =
          FeedbackStatus.values[randomFeedbackStatusIndex];
      AppList.requestsList.add(
        AppRequest(
          id: Random().nextInt(100),
          reportuser: randomUser,
          subject: "subject",
          category: category,
          description: "description",
          status: randomAppStatus,
          responseStatus: randomFeedbackStatus,
          date: newdatetime,
          documents: [],
          adresses: AddresModel(
            neighbourhood: "neighbourhood",
            street: "streetAvenue",
            insidedoor: "insideDoor",
            outdoor: "outDoor",
            description: "neighborhoodDirections",
          ),
        ),
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    startingfunctions();
  }

  @override
  void onClose() {
    super.onClose();
    ll.log("bye bye (splash)");
  }
}
