import 'dart:developer' as ll;
import 'dart:math';

import 'package:feedbackstation/app/data/models/addres_model.dart';
import 'package:feedbackstation/app/data/models/feedbacks_model.dart';
import 'package:feedbackstation/app/data/models/media_model.dart';
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
    requestsListrefresh();
    // ---- Rastgele internet kullanıcıları çek

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

  Future<void> requestsListrefresh() async {
    final apiService = APIServices(
      userTOKEN: AppSession.userTOKEN.toString(),
    );

    //controller.loginstatus.value = true;
    final Map<String, dynamic> getUsersResult =
        await apiService.getfeedbackrequest();
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

    AppList.requestsList.clear();

    for (var element in getUsersResult['response']) {
      AppList.requestsList.add(
        AppRequest(
          id: element['id'],
          reportuser: User(
            avatar: Media(
              id: element['user']['id'],
              type: MediaType.image,
              bigUrl: element['user']['big_avatar'],
              normalUrl: element['user']['normal_avatar'],
              minUrl: element['user']['min_avatar'],
              isLocal: false,
            ),
          ),
          subject: element['subject'],
          category: FeedbackCategory.values.firstWhere(
              (element2) => element2.id == element['feedbacks_category']['id']),
          description: element['description'],
          status: AppStatus.completed,
          date: DateTime(2024),
          documents: [],
          adresses: AddresModel(),
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
          canResponseRequest: false,
          canShowAdminPanel: false,
          canUploadAvatar: false,
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

  void randomInfoRequestFillCategory(FeedbackCategory category) {
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
