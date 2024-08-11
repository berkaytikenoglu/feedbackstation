import 'package:feedbackstation/app/data/models/feedbacks_model.dart';
import 'package:feedbackstation/app/data/models/status_model.dart';
import 'package:feedbackstation/app/modules/requestspages/requestpage/controllers/requestspage_controller.dart';
import 'package:feedbackstation/app/modules/requestspages/requestpage/views/detail_requestspage_view.dart';
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
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(height: 1);
              },
              itemCount: AppList.requestsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: AppList.requestsList[index].category.homepgIcon,
                  title: Text(AppList.requestsList[index].category.title),
                  subtitle: Text(AppList.requestsList[index].subject),
                  trailing: AppList.requestsList[index].status.icon,
                  onTap: () {
                    Get.to(() => const DetailRequestspageView(), arguments: {
                      "id": AppList.requestsList[index].id,
                      "detail": AppList.requestsList[index].category.title,
                    });
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
