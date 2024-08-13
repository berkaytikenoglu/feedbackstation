import 'dart:developer' as log;
import 'dart:math';

import 'package:feedbackstation/app/data/models/adres_model.dart';
import 'package:feedbackstation/app/data/models/feedbacks_model.dart';
import 'package:feedbackstation/app/data/models/request_chart_model.dart';
import 'package:feedbackstation/app/data/models/request_model.dart';
import 'package:feedbackstation/app/data/models/status_model.dart';
// import 'package:feedbackstation/app/data/models/request_model.dart';
import 'package:feedbackstation/app/utils/applist.dart';
import 'package:get/get.dart';

class AdminHomeController extends GetxController {
  var appList = AppList.requestsList.obs;
  var categoryList = <AppChartRequest>[].obs;

  var selectedIndex = 0.obs;

  var viewhourly = true.obs;
  var viewweekly = false.obs;
  var viewmontly = false.obs;
  var viewyearly = false.obs;

  void randomInfoRequestFillCategory(FeedbackCategory category) {
    int rndm = Random().nextInt(50000);

    for (var i = 0; i < rndm; i++) {
      DateTime datetime = DateTime.now();

      int rndmonth = Random().nextInt(12);
      int rndday = Random().nextInt(31);

      int rndhour = Random().nextInt(24);

      int rndmminutes = Random().nextInt(60);

      DateTime newdatetime =
          DateTime(datetime.year, rndmonth, rndday, rndhour, rndmminutes);

      AppList.requestsList.add(
        AppRequest(
          id: Random().nextInt(100),
          subject: "subject",
          category: category,
          description: "description",
          status: AppStatus.approved,
          date: newdatetime,
          documents: [],
          adresses: AdresModel(
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

  void fetchFeedbackCategories() {
    categoryList.clear();
    for (var fetchelement in FeedbackCategory.values) {
      categoryList.add(
        AppChartRequest(
          category: fetchelement,
        ),
      );
    }
  }

  void filterRequestsByHours() {
    for (var element in categoryList) {
      DateTime datetime = DateTime.now();

      element.hourly = [];

      int totalcount = 0;
      for (var i = 0; i < datetime.hour; i++) {
        DateTime startDateTime =
            DateTime(datetime.year, datetime.month, datetime.day, 00 + i);
        DateTime endDateTime = startDateTime.add(const Duration(hours: 1));

        List data = AppList.requestsList
            .where(
              (element2) => ((element2.date.isAfter(startDateTime) &&
                      element2.date.isBefore(endDateTime)) &&
                  element2.category == element.category),
            )
            .toList();
        String? hourstartString;
        String? hourendString;
        if (startDateTime.hour < 10) {
          hourstartString = "0${startDateTime.hour}";
        } else {
          hourstartString = startDateTime.hour.toString();
        }
        if (endDateTime.hour < 10) {
          hourendString = "0${endDateTime.hour}";
        } else {
          hourendString = endDateTime.hour.toString();
        }
        element.hourly!.add({
          " $hourstartString - $hourendString": data.length,
        });
        totalcount += data.length;
        element.hourValue = totalcount;
      }
    }
  }

  void filterRequestsByWeek() {
    for (var element in categoryList) {
      DateTime datetime = DateTime.now();

      int datetimeweekday = datetime.weekday; //haftanın kaçıncı günü
      log.log("haftanın kaçıncı Günü $datetimeweekday");
      element.weekly = [];

      int totalcount = 0;
      for (var i = 0; i < datetimeweekday; i++) {
        DateTime startDateTime = DateTime(
            datetime.year, datetime.month, datetime.day - datetimeweekday + i);
        DateTime endDateTime = datetime;

        List data = AppList.requestsList
            .where(
              (element2) => ((element2.date.isAfter(startDateTime) &&
                      element2.date.isBefore(endDateTime)) &&
                  element2.category == element.category),
            )
            .toList();

        element.weekly!.add({
          " ${startDateTime.day}": data.length,
        });
        totalcount += data.length;
        element.weeklyValue = totalcount;
      }
    }
  }

  void filterRequestsByMontly() {
    for (var element in categoryList) {
      DateTime datetime = DateTime.now();

      element.monthly = [];

      int totalcount = 0;
      for (var i = 0; i < datetime.day; i++) {
        DateTime startDateTime = DateTime(datetime.year, datetime.month, i + 1);
        DateTime endDateTime =
            DateTime(datetime.year, datetime.month, i + 1, 23, 59);

        List data = AppList.requestsList
            .where(
              (element2) => ((element2.date.isAfter(startDateTime) &&
                      element2.date.isBefore(endDateTime)) &&
                  element2.category == element.category),
            )
            .toList();

        element.monthly!.add({
          " ${i + 1}": data.length,
        });
        totalcount += data.length;
        element.monthlyValue = totalcount;
      }
    }
  }

  void filterRequestsByYear() {
    for (var element in categoryList) {
      DateTime datetime = DateTime.now();

      element.yearly = [];

      int totalcount = 0;
      for (var i = 0; i < datetime.month; i++) {
        DateTime startDateTime = DateTime(datetime.year, i + 1, 1);
        DateTime endDateTime = DateTime(datetime.year, i + 2, 1);

        List data = AppList.requestsList
            .where(
              (element2) => ((element2.date.isAfter(startDateTime) &&
                      element2.date.isBefore(endDateTime)) &&
                  element2.category == element.category),
            )
            .toList();

        element.yearly!.add({
          " ${startDateTime.day}": data.length,
        });
        totalcount += data.length;
        element.yearlyValue = totalcount;
      }
    }
  }

  @override
  void onInit() {
    super.onInit();

    log.log("Anasayfaya Hoşgeldiniz");

    // ----

    randomInfoRequestFillCategory(FeedbackCategory.complaint);
    randomInfoRequestFillCategory(FeedbackCategory.informationRequest);
    randomInfoRequestFillCategory(FeedbackCategory.report);
    randomInfoRequestFillCategory(FeedbackCategory.thanks);
    randomInfoRequestFillCategory(FeedbackCategory.request);
    randomInfoRequestFillCategory(FeedbackCategory.projectStatement);

    // ----

    fetchFeedbackCategories();
    filterRequestsByHours();
    filterRequestsByWeek();
    filterRequestsByMontly();
    filterRequestsByYear();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    categoryList.clear();
    log.log("Anasayfadan Çıktınız");
  }

  void updateSelectedIndex(int index) {
    selectedIndex.value = index;

    viewhourly.value = false;
    viewweekly.value = false;
    viewmontly.value = false;
    viewyearly.value = false;
    if (index == 0) {
      viewhourly.value = true;
    } else if (index == 1) {
      viewweekly.value = true;
    } else if (index == 2) {
      viewhourly.value = true;
    } else if (index == 3) {
      viewmontly.value = true;
    } else if (index == 4) {
      viewyearly.value = true;
    }
  }
}
