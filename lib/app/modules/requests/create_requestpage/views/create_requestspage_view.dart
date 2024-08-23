import 'dart:developer';
import 'dart:io';

import 'package:feedbackstation/app/appinfo.dart';
import 'package:feedbackstation/app/modules/requests/create_requestpage/controllers/create_requestspage_controller.dart';
import 'package:feedbackstation/app/utils/applist.dart';
import 'package:feedbackstation/app/utils/session.dart';
import 'package:feedbackstation/app/widgets/appbar/appbar_widget.dart';
import 'package:feedbackstation/app/widgets/textfields_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateRequestspageView extends StatelessWidget {
  const CreateRequestspageView({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateRequestspageController controller =
        Get.put(CreateRequestspageController());

    return Obx(
      () => Scaffold(
        appBar: AppbarWidget(
          title:
              "${controller.category.value == null ? "Kategori Seçimi " : controller.category.value!.name} Formu",
        ),
        body: controller.category.value == null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        MediaQuery.of(context).size.width > 600 ? 2 : 1,
                    crossAxisSpacing: 10, // Sütunlar arasındaki boşluk
                    mainAxisSpacing: 10, // Satırlar arasındaki boşluk
                    childAspectRatio: 3.618, // Çocukların en/boy oranı
                  ),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(
                        AppList.requestcategoriesList[index].icon,
                        size: 100,
                        color: Colors.white,
                      ),
                      title: SizedBox(
                        child: Text(
                          AppList.requestcategoriesList[index].name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ),
                      subtitle: SizedBox(
                        height: 100,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                AppList
                                    .requestcategoriesList[index].description,
                                style: const TextStyle(color: Colors.white),
                              ),
                              const Text(
                                "Talebi Oluşturmak için Tıklayınız",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      tileColor: const Color(0xFF3C4CBD),
                      onTap: () {
                        controller.category.value =
                            AppList.requestcategoriesList[index];
                      },
                    );
                  },
                  itemCount: AppList.requestcategoriesList.length,
                ),
              )
            : SingleChildScrollView(
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
                      Row(
                        children: [
                          AppSession.user.address == null
                              ? Container()
                              : ElevatedButton(
                                  onPressed: AppSession.user.address == null
                                      ? null
                                      : () {
                                          if (AppSession.user.address == null) {
                                            return;
                                          }
                                          controller.mahalle.value.text =
                                              AppSession
                                                  .user.address!.neighbourhood!
                                                  .toString();
                                          controller.sokakCadde.value.text =
                                              AppSession.user.address!.street!
                                                  .toString();
                                          controller.disKapi.value.text =
                                              AppSession.user.address!.outdoor!
                                                  .toString();
                                          controller.icKapi.value.text =
                                              AppSession
                                                  .user.address!.insidedoor!
                                                  .toString();
                                          controller.adresTarif.value.text =
                                              AppSession
                                                  .user.address!.description!
                                                  .toString();
                                        },
                                  child: const Text(
                                    "Mevcut Adres Bilgilerimi Getir",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
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
                        controller: controller.mahalle.value,
                        label: "Mahalle",
                      ),
                      TextfieldWidget.costum1(
                        controller: controller.sokakCadde.value,
                        label: "Sokak-Cadde",
                      ),
                      TextfieldWidget.costum1(
                        controller: controller.disKapi.value,
                        label: "Dış Kapı No",
                      ),
                      TextfieldWidget.costum1(
                        controller: controller.icKapi.value,
                        label: "İç Kapı No",
                      ),
                      TextfieldWidget.costum1(
                        controller: controller.adresTarif.value,
                        label: "Adres Tarifi",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Konu Başlığı",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const Divider(),
                      TextfieldWidget.costum1(
                        controller: controller.konu.value,
                        label: "",
                        hinttext: "Konuyu özetleyen bir başlık yazınız!",
                        maxline: 1,
                        minline: 1,
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
                        controller: controller.basvuruMetni.value,
                        label: "Başvuru Metni",
                        hinttext: "",
                        maxline: 100,
                        minline: 5,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: ElevatedButton(
                          onPressed: () async =>
                              await controller.addmedialist(),
                          child: const Text('Dosya Seç'),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Obx(() => Visibility(
                            visible: controller.mediaList.isNotEmpty,
                            child: SizedBox(
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
                                              (file.extension!.toLowerCase() ==
                                                      'jpg' ||
                                                  file.extension!
                                                          .toLowerCase() ==
                                                      'png' ||
                                                  file.extension!
                                                          .toLowerCase() ==
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
                                              onPressed: () =>
                                                  controller.removemedia(
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
                            ),
                          )),
                      ElevatedButton(
                        onPressed: () {
                          controller.addRequest();
                        },
                        child: const Text("Gönder"),
                      ),
                      const SizedBox(height: 200),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
