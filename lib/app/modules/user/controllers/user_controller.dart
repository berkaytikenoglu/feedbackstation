import 'dart:developer';

import 'package:feedbackstation/app/data/models/user_model.dart';
import 'package:feedbackstation/app/data/repositories/user_repository.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepository userRepository;

  UserController({required this.userRepository});

  // Kullanıcı listesini saklayan Rx değişken
  var userList = <User>[].obs;

  // Yükleniyor durumunu saklayan Rx değişken
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
    log("----user sayfası açıldı");
  }

  @override
  void onClose() {
    super.onClose();
    log("---user sayfası kapandı");
  }

  // Kullanıcıları getiren ve listeye ekleyen yöntem
  void fetchUsers() async {
    try {
      isLoading(true);
      var users = await userRepository.getAllUsers();
      userList.assignAll(users);
    } finally {
      isLoading(false);
    }
  }
}
