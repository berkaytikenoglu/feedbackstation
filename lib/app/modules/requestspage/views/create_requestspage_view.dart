import 'dart:developer';

import 'package:feedbackstation/app/appinfo.dart';
import 'package:feedbackstation/app/modules/requestspage/controllers/create_requestspage_controller.dart';
import 'package:feedbackstation/app/widgets/textfields_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateRequestspageView extends GetView<CreateRequestspageController> {
  const CreateRequestspageView({super.key});

  @override
  Widget build(BuildContext context) {
    // URL'den gelen 'id' parametresini alıyoruz
    Map<dynamic, String> data = Get.arguments;

    final requestId = data["page"];
    log(data.length.toString());

    Future<void> pickFile() async {
      // Dosya seçici açılır
      final result = await FilePicker.platform.pickFiles(allowMultiple: true);

      // Seçilen dosya varsa işlemler yapılır
      if (result != null) {
        for (var file in result.files) {
          // Dosya bilgilerini yazdırabilirsiniz
          print('Dosya Adı: ${file.name}');
          print('Dosya Uzantısı: ${file.extension}');
          print('Dosya Yolu: ${file.path}');
          print('Dosya İçeriği: ${file.size}'); // Bytes olarak dosya içeriği
        }
      } else {
        // Kullanıcı dosya seçmezse
        print('Hiçbir dosya seçilmedi.');
      }
    }

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
              Text(
                "Adres Bilgileri",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Divider(),
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
              SizedBox(
                height: 15,
              ),
              Text(
                "Talep",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Divider(),
              TextfieldWidget.costum1(
                controller: TextEditingController(),
                label: "Başvuru Metni",
                hinttext: "",
                maxline: 100,
                minline: 5,
              ),
              ElevatedButton(
                onPressed: () async => await pickFile(),
                child: Text('Dosya Seç'),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
