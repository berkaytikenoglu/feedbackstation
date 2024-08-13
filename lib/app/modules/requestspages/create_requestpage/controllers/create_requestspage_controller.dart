import 'dart:developer';

import 'package:feedbackstation/app/data/models/adres_model.dart';
import 'package:feedbackstation/app/data/models/feedbacks_model.dart';
import 'package:feedbackstation/app/data/models/request_model.dart';
import 'package:feedbackstation/app/data/models/status_model.dart';
import 'package:feedbackstation/app/utils/applist.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateRequestspageController extends GetxController {
  var mediaList = <PlatformFile>[].obs;

  var mahalle = TextEditingController().obs;
  var sokakCadde = TextEditingController().obs;
  var sokakCaddeAra = TextEditingController().obs;
  var disKapi = TextEditingController().obs;
  var icKapi = TextEditingController().obs;
  var adresTarif = TextEditingController().obs;
  var basvuruMetni = TextEditingController().obs;
  var konu = TextEditingController().obs;

  void addRequest({required FeedbackCategory requestCategory}) {
    log("${mahalle.value.text}, ${sokakCadde.value.text}, ${sokakCaddeAra.value.text}, ${disKapi.value.text},${icKapi.value.text},${adresTarif.value.text},${basvuruMetni.value.text},${konu.value.text}, ");

    AppList.requestsList.add(
      AppRequest(
        id: 1,
        subject: konu.value.text,
        adresses: AdresModel(
          neighbourhood: mahalle.value.text,
          streetAvenue: sokakCadde.value.text,
          streetAvenueAlley: sokakCaddeAra.value.text,
          insideDoor: icKapi.value.text,
          outDoor: disKapi.value.text,
          neighborhoodDirections: adresTarif.value.text,
        ),
        category: requestCategory,
        description: basvuruMetni.value.text,
        status: AppStatus.pending,
        date: DateTime.now(),
        documents: [],
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    log("-------Hoşgeldin-------");
    log(mediaList.length.toString());
  }

  @override
  void onClose() {
    super.onClose();
    mediaList.clear();
    log("-------Güle Güle-------");
  }

  Future<FilePickerResult?> pickFile() async {
    // Dosya seçici açılır
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);

    // Seçilen dosya varsa işlemler yapılır
    if (result != null) {
      for (var file in result.files) {
        // Dosya bilgilerini yazdırabilirsiniz
        log('Dosya Adı: ${file.name}');
        log('Dosya Uzantısı: ${file.extension}');
        log('Dosya Yolu: ${file.path}');
        log('Dosya İçeriği: ${file.size}'); // Bytes olarak dosya içeriği
      }
    } else {
      // Kullanıcı dosya seçmezse
      log('Hiçbir dosya seçilmedi.');
    }

    return result;
  }

  Future<void> addmedialist() async {
    final result = await pickFile();

    if (result != null) {
      mediaList.addAll(result.files);
    }
  }

  void removemedia(PlatformFile media) {
    mediaList.removeWhere((element) => element == media);
  }
}
