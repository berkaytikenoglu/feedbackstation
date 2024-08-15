import 'dart:developer' as ll;
import 'dart:math';

import 'package:feedbackstation/app/data/models/adres_model.dart';
import 'package:feedbackstation/app/data/models/feedbacks_model.dart';
import 'package:feedbackstation/app/data/models/request_model.dart';
import 'package:feedbackstation/app/data/models/status_model.dart';
import 'package:feedbackstation/app/data/models/user_model.dart';
import 'package:feedbackstation/app/data/providers/user_provider.dart';
import 'package:feedbackstation/app/utils/applist.dart';
import 'package:get/get.dart';

class StartingpageController extends GetxController {
  Future<void> startingfunctions() async {
    // ---- Rastgele internet kullanıcıları çek

    await fetchUserRandom();
    // ----
    randomInfoRequestFillCategory(FeedbackCategory.complaint);
    randomInfoRequestFillCategory(FeedbackCategory.informationRequest);
    randomInfoRequestFillCategory(FeedbackCategory.report);
    randomInfoRequestFillCategory(FeedbackCategory.thanks);
    randomInfoRequestFillCategory(FeedbackCategory.request);
    randomInfoRequestFillCategory(FeedbackCategory.projectStatement);

    // ----
  }

  Future<void> fetchUserRandom() async {
    ll.log("Rastgele Üyeler Çekiliyor...");

    for (var i = 0; i < 10; i++) {
      List<User> aa = await UserProvider().fetchRandomUsers();
      for (User element in aa) {
        AppList.userList.add(element);
      }
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
            streetAvenue: "streetAvenue",
            streetAvenueAlley: "streetAvenueAlley",
            insideDoor: "insideDoor",
            outDoor: "outDoor",
            neighborhoodDirections: "neighborhoodDirections",
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
