import 'package:feedbackstation/app/data/models/feedbacks_model.dart';
import 'package:feedbackstation/app/data/models/status_model.dart';
import 'package:feedbackstation/app/modules/requestspage/controllers/requestspage_controller.dart';
import 'package:feedbackstation/app/utils/applist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestspageView extends GetView<RequestspageController> {
  const RequestspageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Taleplerim",
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Tarih Seç"),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Kategori Seç"),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: AppList.requestsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: AppList.requestsList[index].category.homepgIcon,
                  title: Text(AppList.requestsList[index].category.title),
                  subtitle: Text(AppList.requestsList[index].description),
                  trailing: AppList.requestsList[index].status.icon,
                  onTap: () {
                    if (AppList.requestsList[index].category ==
                        FeedbackCategory.request) {
                      // Get.to(() => const CreateRequestspageView());
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
