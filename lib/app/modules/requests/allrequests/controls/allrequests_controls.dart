import 'dart:developer';

import 'package:feedbackstation/app/data/models/addres_model.dart';
import 'package:feedbackstation/app/data/models/feedbacks_model.dart';
import 'package:feedbackstation/app/data/models/media_model.dart';
import 'package:feedbackstation/app/data/models/request_model.dart';
import 'package:feedbackstation/app/data/models/status_model.dart';
import 'package:feedbackstation/app/data/models/user_model.dart';
import 'package:feedbackstation/app/services/API/api.dart';
import 'package:feedbackstation/app/utils/applist.dart';
import 'package:feedbackstation/app/utils/session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllrequestspageController extends GetxController {
  //

  var requestsList = <AppRequest>[].obs;
  var selectedDate = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    requestsList.value = AppList.requestsList.obs;
    log("sa");
  }

  @override
  void onClose() {
    super.onClose();
    log("bye");
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

    requestsList.clear();

    for (var element in getUsersResult['response']) {
      requestsList.add(
        AppRequest(
          id: element['id'],
          reportuser: User(
            id: element['user']['id'],
            displayname: element['user']['name'],
            email: element['user']['email'],
            firstname: element['user']['firstname'],
            gender:
                element['user']['gender'] == 1 ? Gender.male : Gender.female,
            lastname: element['user']['lastname'],
            phonenumber: element['user']['phonenumber'],
            serialNumber: element['user']['tc_identity'],
            address: null,
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

  void sortRequestsByDate() {
    requestsList.sort((a, b) => a.date.compareTo(b.date));
  }

  void sortRequestsByCategory() {
    requestsList.sort((a, b) => a.category.title.compareTo(b.category.title));
  }

  void filterRequestsByName(String query) {
    if (query.isEmpty) {
      requestsList.assignAll(AppList.requestsList);
    } else {
      requestsList.assignAll(AppList.requestsList.where((request) =>
          request.subject.toLowerCase().contains(query.toLowerCase())));
    }
  }

  void filterRequestsByDate(DateTime query) {
    requestsList.assignAll(
        AppList.requestsList.where((request) => request.date == query));
  }

  void filterRequestsByDateonlyYear(int query) {
    requestsList.assignAll(
        AppList.requestsList.where((request) => request.date.year == query));
  }

  void pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
      filterRequestsByDate(pickedDate);
    }
  }

  Future<int?> showYearPicker(BuildContext context, {int? initialYear}) async {
    final DateTime now = DateTime.now();
    final int currentYear = now.year;

    return showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Yıl Seçin'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: 100, // Örneğin, son 100 yıl
              itemBuilder: (BuildContext context, int index) {
                final int displayYear = currentYear - index;
                return ListTile(
                  title: Text(displayYear.toString()),
                  onTap: () {
                    Navigator.of(context).pop(displayYear);
                    filterRequestsByDateonlyYear(displayYear);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  // final currentPage = 0.obs;
  // final itemsPerPage = 4;

  // List<AppRequest> get pagedItems {
  //   final startIndex = currentPage.value * itemsPerPage;
  //   final endIndex = (startIndex + itemsPerPage) > requestsList.length
  //       ? requestsList.length
  //       : startIndex + itemsPerPage;
  //   return requestsList.sublist(startIndex, endIndex);
  // }

  // void nextPage() {
  //   if ((currentPage.value + 1) * itemsPerPage < requestsList.length) {
  //     currentPage.value++;
  //   }
  // }

  // void previousPage() {
  //   if (currentPage.value > 0) {
  //     currentPage.value--;
  //   }
  // }
}
