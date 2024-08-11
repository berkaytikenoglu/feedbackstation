import 'dart:developer';
import 'dart:io';

import 'package:feedbackstation/app/appinfo.dart';
import 'package:feedbackstation/app/modules/requestspages/requestpage/controllers/create_requestspage_controller.dart';
import 'package:feedbackstation/app/widgets/textfields_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateRequestspageView extends StatelessWidget {
  const CreateRequestspageView({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateRequestspageController controller =
        Get.put(CreateRequestspageController());

    Map<String, dynamic> data = Get.arguments;
    final requestId = data["page"];

    return Scaffold(
      appBar: AppBar(
        title: Text('$requestId Formu'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  AppInfo.appImage,
                  scale: 3,
                ),
              ),
              const Text(
                "Adres Bilgileri",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Divider(),
              TextfieldWidget.costum1(
                controller: TextEditingController(),
                label: "Mahalle",
              ),
              TextfieldWidget.costum1(
                controller: TextEditingController(),
                label: "Sokak-Cadde",
              ),
              TextfieldWidget.costum1(
                controller: TextEditingController(),
                label: "Sokak-Cadde Ara",
              ),
              TextfieldWidget.costum1(
                controller: TextEditingController(),
                label: "Dış Kapı No",
              ),
              TextfieldWidget.costum1(
                controller: TextEditingController(),
                label: "İç Kapı No",
              ),
              TextfieldWidget.costum1(
                controller: TextEditingController(),
                label: "Adres Tarifi",
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Talep",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Divider(),
              TextfieldWidget.costum1(
                controller: TextEditingController(),
                label: "Başvuru Metni",
                hinttext: "",
                maxline: 100,
                minline: 5,
              ),
              ElevatedButton(
                onPressed: () async => await controller.addmedialist(),
                child: const Text('Dosya Seç'),
              ),
              const SizedBox(height: 10),
              Obx(() => SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.mediaList.length,
                      // itemCount: 0,
                      itemBuilder: (context, index) {
                        final file = controller.mediaList[index];
                        log("$index - ${file.extension}");
                        return Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: SizedBox(
                            width: 300,
                            child: Column(
                              children: [
                                if (file.path != null &&
                                    (file.extension!.toLowerCase() == 'jpg' ||
                                        file.extension!.toLowerCase() ==
                                            'png' ||
                                        file.extension!.toLowerCase() ==
                                            'jpeg'))
                                  Container(
                                    color: Colors.black,
                                    child: Image.file(
                                      File(file.path!),
                                      height: 200,
                                      width: 300,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ListTile(
                                  title: Text(
                                    controller.mediaList[index].name,
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed: () => controller.removemedia(
                                      controller.mediaList[index],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )),
              const SizedBox(height: 200),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Gönder"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
