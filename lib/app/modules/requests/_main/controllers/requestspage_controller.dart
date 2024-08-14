import 'dart:developer';

import 'package:feedbackstation/app/data/models/feedbacks_model.dart';
import 'package:feedbackstation/app/utils/applist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestspageController extends GetxController {
  //

  var requestsList = AppList.requestsList.obs;
  var selectedDate = DateTime.now().obs;

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

  @override
  void onInit() {
    super.onInit();

    log("sa");
  }

  @override
  void onClose() {
    super.onClose();
    log("bye");
  }
}
