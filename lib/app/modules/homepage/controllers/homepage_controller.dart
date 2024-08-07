import 'package:feedbackstation/app/data/models/user_model.dart';
import 'package:feedbackstation/app/data/repositories/user_repository.dart';
import 'package:get/get.dart';

class HomepageController extends GetxController {
  final UserRepository homepageRepository;

  HomepageController({required this.homepageRepository});

  // Kullanıcı listesini saklayan Rx değişken
  var userList = <User>[].obs;

  // Yükleniyor durumunu saklayan Rx değişken
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  // Kullanıcıları getiren ve listeye ekleyen yöntem
  void fetchUsers() async {
    try {
      isLoading(true);
      var users = await homepageRepository.getAllUsers();
      userList.assignAll(users);
    } finally {
      isLoading(false);
    }
  }
}
