import 'package:feedbackstation/app/data/models/feedbacks_model.dart';
import 'package:feedbackstation/app/data/models/status_model.dart';
import 'package:feedbackstation/app/modules/requests/list_requestpage/controllers/requestspage_controller.dart';
import 'package:feedbackstation/app/modules/requests/detail_requestpage/views/detail_requestspage_view.dart';
import 'package:feedbackstation/app/widgets/appbar/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestspageView extends StatelessWidget {
  const RequestspageView({super.key});

  @override
  Widget build(BuildContext context) {
    final RequestspageController controller = Get.put(RequestspageController());
    return Scaffold(
      appBar: const AppbarWidget(title: "Taleplerim"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              color: Colors.white,
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
                      padding: const EdgeInsets.all(8.0),
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
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed("/requests/create");
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.add,
                            ),
                            Text(" Talep Oluştur"),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
                child: Column(
              children: [
                ...List.generate(
                  controller.pagedItems.length,
                  (index) {
                    return Obx(
                      () => ListTile(
                        tileColor: Get.theme.primaryColor,
                        leading: Icon(
                          controller.pagedItems[index].category.homepgIcon,
                          size: 60,
                          color: Colors.white,
                        ),
                        title: Text(
                          controller.pagedItems[index].category.title,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          "${controller.pagedItems[index].subject} ${controller.pagedItems[index].date.day}.${controller.pagedItems[index].date.month}.${controller.pagedItems[index].date.year} ",
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        trailing: Icon(
                          controller.requestsList[index].status.icon,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Get.to(() => const DetailRequestspageView(),
                              arguments: {
                                "id": controller.requestsList[index].id,
                                "detail": controller
                                    .requestsList[index].category.title,
                              });
                        },
                      ),
                    );
                  },
                )
              ],
            )),
            Obx(
              () => Row(
                children: [
                  const Spacer(),
                  ElevatedButton(
                    onPressed: controller.previousPage,
                    child: const Text('Previous'),
                  ),
                  Text('Page ${controller.currentPage.value + 1}'),
                  ElevatedButton(
                    onPressed: controller.nextPage,
                    child: const Text('Next'),
                  ),
                  const Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
