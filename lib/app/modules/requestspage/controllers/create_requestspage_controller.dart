import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class CreateRequestspageController extends GetxController {
  var mediaList = <PlatformFile>[].obs;

  @override
  void onInit() {
    super.onInit();
    log("-------Hoşgeldin-------");
    log(mediaList.length.toString());
  }

  @override
  void onClose() {
    // Sayfa kapatıldığında mediaList temizlenir
    mediaList.clear();
    log("-------Güle Güle-------");
    super.onClose();
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
