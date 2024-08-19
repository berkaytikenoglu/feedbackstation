import 'dart:developer';

import 'package:file_picker/file_picker.dart';

class FilePickerWidget {
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
}
