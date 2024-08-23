import 'dart:developer';

import 'package:feedbackstation/app/data/models/addres_model.dart';
import 'package:feedbackstation/app/data/models/feedbacks_category_model.dart';
import 'package:feedbackstation/app/data/models/request_model.dart';
import 'package:feedbackstation/app/data/models/status_model.dart';
import 'package:feedbackstation/app/services/API/api.dart';
import 'package:feedbackstation/app/utils/applist.dart';
import 'package:feedbackstation/app/utils/session.dart';
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

  var category = Rx<FeedbacksCategoryModel?>(null);

  Future<void> addRequest() async {
    log("${mahalle.value.text}, ${sokakCadde.value.text}, ${sokakCaddeAra.value.text}, ${disKapi.value.text},${icKapi.value.text},${adresTarif.value.text},${basvuruMetni.value.text},${konu.value.text}, ${category.value!.name} ");

    final apiService = APIServices(
      userTOKEN: AppSession.userTOKEN.toString(),
    );

    //controller.loginstatus.value = true;
    final Map<String, dynamic> getUsersResult =
        await apiService.addfeedbackrequest(
      addressDescription: adresTarif.value.text,
      addressInsidedoor: icKapi.value.text,
      addressNeighbourhood: mahalle.value.text,
      addressOutdoor: disKapi.value.text,
      addressStreet: sokakCadde.value.text,
      addressPostalcode: "52400",
      addressCity: "FATSA",
      addressProvince: "ORDU",
      addressCountry: "TÜRKİYE",
      categoryID: category.value!.id,
      description: basvuruMetni.value.text,
      subject: konu.value.text,
      userID: AppSession.user.id!,
    );
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

    AppList.requestsList.add(
      AppRequest(
        id: 1,
        reportuser: AppSession.user,
        subject: konu.value.text,
        adresses: AddresModel(
          neighbourhood: mahalle.value.text,
          street: sokakCadde.value.text,
          insidedoor: icKapi.value.text,
          outdoor: disKapi.value.text,
          description: adresTarif.value.text,
        ),
        category: category.value!,
        description: basvuruMetni.value.text,
        status: AppStatus.pending,
        date: DateTime.now(),
        documents: [],
      ),
    );
    Get.back();
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
