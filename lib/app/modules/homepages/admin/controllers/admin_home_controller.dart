import 'dart:developer';

import 'package:feedbackstation/app/data/models/feedbacks_model.dart';
import 'package:feedbackstation/app/data/models/request_chart_model.dart';
import 'package:feedbackstation/app/data/models/request_model.dart';
import 'package:feedbackstation/app/utils/applist.dart';
import 'package:get/get.dart';

class AdminHomeController extends GetxController {
  var appList = AppList.requestsList.obs;
  var categoryList = <AppChartRequest>[].obs;

  void fetchFeedbackCategories() {
    categoryList.clear();
    for (var fetchelement in FeedbackCategory.values) {
      List<AppRequest> aa = AppList.requestsList
          .where((element) => element.category == fetchelement)
          .toList();

      categoryList.add(
        AppChartRequest(
          category: fetchelement,
          value: aa.length,
        ),
      );
    }
  }

  void filterRequestsByHours() {
    for (var element in categoryList) {
      DateTime datetime = DateTime.now();

      element.saatlik = [];

      for (var i = 0; i < 24; i++) {
        DateTime startDateTime =
            DateTime(datetime.year, datetime.month, datetime.day, 00);
        DateTime endDateTime = startDateTime.add(const Duration(hours: 1));

        List data = AppList.requestsList
            .where(
              (element) => (element.date.isAfter(startDateTime) &&
                  element.date.isBefore(endDateTime)),
            )
            .toList();

        element.saatlik!.add({
          " ${startDateTime.hour.toString()}-${endDateTime.hour.toString()}":
              data.length,
        });
      }
    }
  }

  //  void filterRequestsByWeek() {
  //   for (var element in categoryList) {
  //     DateTime datetime = DateTime.now();

  //     element.saatlik = [];

  //     for (var i = 0; i < 24; i++) {
  //       DateTime startDateTime =
  //           DateTime(datetime.year, datetime.month, datetime.day, 00);
  //       DateTime endDateTime = startDateTime.add(const Duration(hours: 1));

  //       List data = AppList.requestsList
  //           .where(
  //             (element) => (element.date.isAfter(startDateTime) &&
  //                 element.date.isBefore(endDateTime)),
  //           )
  //           .toList();

  //       element.saatlik!.add({
  //         " ${startDateTime.hour.toString()}-${endDateTime.hour.toString()}":
  //             data.length,
  //       });
  //     }
  //   }
  // }

  //  void filterRequestsByYear() {
  //   for (var element in categoryList) {
  //     DateTime datetime = DateTime.now();

  //     element.saatlik = [];

  //     for (var i = 0; i < 24; i++) {
  //       DateTime startDateTime =
  //           DateTime(datetime.year, datetime.month, datetime.day, 00);
  //       DateTime endDateTime = startDateTime.add(const Duration(hours: 1));

  //       List data = AppList.requestsList
  //           .where(
  //             (element) => (element.date.isAfter(startDateTime) &&
  //                 element.date.isBefore(endDateTime)),
  //           )
  //           .toList();

  //       element.saatlik!.add({
  //         " ${startDateTime.hour.toString()}-${endDateTime.hour.toString()}":
  //             data.length,
  //       });
  //     }
  //   }
  // }

  void asdas() {
    List<AppRequest> aa = AppList.requestsList
        .where((element) => element.category == FeedbackCategory.complaint)
        .toList();

    aa.length;
  }

  @override
  void onInit() {
    super.onInit();

    log("Anasayfaya Hoşgeldiniz");
    fetchFeedbackCategories();
    filterRequestsByHours();
    // filterRequestsByMounth(2024);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();

    log("Anasayfadan Çıktınız");
  }
}
