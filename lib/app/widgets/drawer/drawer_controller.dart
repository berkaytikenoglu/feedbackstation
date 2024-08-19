import 'package:feedbackstation/app/data/models/permission_model.dart';
import 'package:feedbackstation/app/utils/session.dart';
import 'package:get/get.dart';

class DrawerWidgetController extends GetxController {
  var displayName = ''.obs;
  var avatarUrl = ''.obs;
  var email = ''.obs;
  var permission = Rx<PermissionModel?>(null);

  @override
  void onInit() {
    // Başlangıç verilerini yükleyin
    displayName.value = AppSession.user.displayname ?? '';
    avatarUrl.value = AppSession.user.avatar?.normalUrl ?? '';
    email.value = AppSession.user.email ?? '';
    if (AppSession.user.permission != null) {
      permission.value = AppSession.user.permission;
    }
    super.onInit();
  }

  void refreshprofiledetail() {
    displayName.value = AppSession.user.displayname ?? '';
    avatarUrl.value = AppSession.user.avatar?.normalUrl ?? '';
    email.value = AppSession.user.email ?? '';
    if (AppSession.user.permission != null) {
      permission.value = AppSession.user.permission;
    }
  }
}
