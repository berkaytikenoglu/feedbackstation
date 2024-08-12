import 'package:feedbackstation/app/data/models/feedbacks_model.dart';
import 'package:feedbackstation/app/data/models/status_model.dart';
import 'package:feedbackstation/app/modules/requestspages/_main/controllers/requestspage_controller.dart';
import 'package:feedbackstation/app/modules/requestspages/detail_requestpage/views/detail_requestspage_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestspageView extends StatelessWidget {
  const RequestspageView({super.key});

  @override
  Widget build(BuildContext context) {
    final RequestspageController controller = Get.put(RequestspageController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Taleplerim",
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 80,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.showYearPicker(context);
                    },
                    child: const Text("Tarih Seç"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        controller.sortRequestsByCategory();
                      },
                      child: const Text("Kategori Sırala")),
                ),
                SizedBox(
                  width: 200,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Arama yapın',
                      ),
                      onChanged: (query) {
                        controller.filterRequestsByName(
                            query); // Güncellenmiş arama fonksiyonunu çağır
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 1);
                },
                itemCount: controller.requestsList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: controller.requestsList[index].category.homepgIcon,
                    title: Text(
                      controller.requestsList[index].category.title,
                    ),
                    subtitle: Text(
                        "${controller.requestsList[index].subject} ${controller.requestsList[index].date.day}.${controller.requestsList[index].date.month}.${controller.requestsList[index].date.year} "),
                    trailing: controller.requestsList[index].status.icon,
                    onTap: () {
                      Get.to(() => const DetailRequestspageView(), arguments: {
                        "id": controller.requestsList[index].id,
                        "detail": controller.requestsList[index].category.title,
                      });
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
