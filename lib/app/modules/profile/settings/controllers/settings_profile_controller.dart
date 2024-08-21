import 'package:feedbackstation/app/data/models/media_model.dart';
import 'package:feedbackstation/app/data/models/permission_model.dart';
import 'package:feedbackstation/app/data/models/user_model.dart';
import 'package:feedbackstation/app/services/API/api.dart';
import 'package:feedbackstation/app/utils/filepicker.dart';
import 'package:feedbackstation/app/utils/session.dart';
import 'package:feedbackstation/app/widgets/appbar/appbar_controller.dart';
import 'package:feedbackstation/app/widgets/drawer/drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsProfileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final User profileUser;
  SettingsProfileController({required this.profileUser});

  late TabController tabbarController;

  var userid = Rx<int?>(null);

  var userpermission = Rx<PermissionModel?>(null);

  var avatar = Rx<Media?>(null);

  var displayname = Rx<String?>(null);

  var firstname = Rx<String?>(null);
  var lastname = Rx<String?>(null);
  var tcno = Rx<String?>(null);
  var phone = Rx<String?>(null);
  var gender = Rx<String?>(null);
  var mail = Rx<String?>(null);
  var neighbourhood = Rx<String?>(null);
  var streetAvenue = Rx<String?>(null);
  var streetAvenueAlley = Rx<String?>(null);
  var outDoor = Rx<String?>(null);
  var insideDoor = Rx<String?>(null);
  var neighborhoodDirections = Rx<String?>(null);

  var countinfooaflk = 0.obs;

  // AppBarController'ı Get.find ile bulun
  final AppBarWidgetController appBarController =
      Get.find<AppBarWidgetController>();

  final DrawerWidgetController drawerController =
      Get.find<DrawerWidgetController>();

  void fetchvalue(User profileUser) {
    appBarController.refreshprofiledetail();
    drawerController.refreshprofiledetail();

    countinfooaflk.value = 0;

    if (profileUser.id != null) {
      userid.value = profileUser.id;
    }

    if (profileUser.permission != null) {
      userpermission.value = profileUser.permission;
    }

    if (profileUser.avatar != null) {
      countinfooaflk++;
      avatar.value = profileUser.avatar;
    }

    if (profileUser.displayname != null || profileUser.displayname == "") {
      countinfooaflk++;
      displayname.value = profileUser.displayname.toString();
    }

    if (profileUser.firstname != null || profileUser.firstname == "") {
      countinfooaflk++;
      firstname.value = profileUser.firstname.toString();
    }

    if (profileUser.lastname != null && profileUser.lastname != "") {
      countinfooaflk++;
      lastname.value = profileUser.lastname.toString();
    }

    if (profileUser.serialNumber != null && profileUser.serialNumber != "") {
      countinfooaflk++;
      tcno.value = profileUser.serialNumber.toString();
    }

    if (profileUser.phonenumber != null && profileUser.phonenumber != "") {
      countinfooaflk++;
      phone.value = profileUser.phonenumber.toString();
    }

    if (profileUser.email != null && profileUser.email != "") {
      countinfooaflk++;
      mail.value = profileUser.email.toString();
    }

    if (profileUser.gender != null) {
      countinfooaflk++;
      gender.value = profileUser.gender!.val.toString();
    }

    if (profileUser.address != null) {
      if (profileUser.address!.neighbourhood != null) {
        countinfooaflk++;
        neighbourhood.value = profileUser.address!.neighbourhood.toString();
      }
    }

    if (profileUser.address != null) {
      if (profileUser.address!.streetAvenue != null) {
        countinfooaflk++;
        streetAvenue.value = profileUser.address!.streetAvenue.toString();
      }
    }

    if (profileUser.address != null) {
      if (profileUser.address!.streetAvenueAlley != null) {
        countinfooaflk++;
        streetAvenueAlley.value =
            profileUser.address!.streetAvenueAlley.toString();
      }
    }

    if (profileUser.address != null) {
      if (profileUser.address!.outDoor != null) {
        countinfooaflk++;
        outDoor.value = profileUser.address!.outDoor.toString();
      }
    }

    if (profileUser.address != null) {
      if (profileUser.address!.insideDoor != null) {
        countinfooaflk++;
        insideDoor.value = profileUser.address!.insideDoor.toString();
      }
    }
    if (profileUser.address != null) {
      if (profileUser.address!.neighborhoodDirections != null) {
        countinfooaflk++;
        neighborhoodDirections.value =
            profileUser.address!.neighborhoodDirections.toString();
      }
    }
  }

  Future<void> updateinfoweb(Map<String, String> formData) async {
    final userApiService =
        APIServices(userTOKEN: AppSession.userTOKEN.toString());

    final Map<String, dynamic> getUsersResult = await userApiService.editUser(
      userID: profileUser.id!,
      formData: formData,
    );

    if (getUsersResult['status'] != true) {
      Get.snackbar(
        "Sistem",
        getUsersResult['message'].toString(),
        colorText: Colors.white,
        backgroundColor: Colors.black38,
      );
      return;
    }
  }

  Future<void> updateFirstName(User profileUser, String newName) async {
    final Map<String, String> formData = {
      "firstname": newName,
      "name": "${firstname.value!} $newName"
    };
    await updateinfoweb(formData);

    firstname.value = newName;
    profileUser.firstname = newName;

    profileUser.displayname = "$newName ${lastname.value!}";

    fetchvalue(profileUser);
  }

  Future<void> updateLastName(User profileUser, String newName) async {
    final Map<String, String> formData = {
      "lastname": newName,
      "name": "${firstname.value!} $newName"
    };
    await updateinfoweb(formData);

    lastname.value = newName;
    profileUser.lastname = newName;

    profileUser.displayname = "${firstname.value!} $newName";

    fetchvalue(profileUser);
  }

  Future<void> updatetcno(User profileUser, String newName) async {
    final Map<String, String> formData = {"tc_identity": newName};
    await updateinfoweb(formData);
    tcno.value = newName;
    profileUser.serialNumber = newName;
    fetchvalue(profileUser);
  }

  Future<void> updatephone(User profileUser, String newName) async {
    final Map<String, String> formData = {"phonenumber": newName};
    await updateinfoweb(formData);
    phone.value = newName;
    profileUser.phonenumber = newName;
    fetchvalue(profileUser);
  }

  Future<void> updatemail(User profileUser, String newName) async {
    final Map<String, String> formData = {"email": newName};
    await updateinfoweb(formData);
    mail.value = newName;
    profileUser.email = newName;
    fetchvalue(profileUser);
  }

  void updategender(User profileUser, String newName) {
    // gender.value = newName;
    // profileUser!.gender = newName;
  }

  void updateneighbour(User profileUser, String newName) {
    neighbourhood.value = newName;
    profileUser.address!.neighbourhood = newName;
    fetchvalue(profileUser);
  }

  void updatestreetAvenue(User profileUser, String newName) {
    streetAvenue.value = newName;
    profileUser.address!.streetAvenue = newName;
    fetchvalue(profileUser);
  }

  void updatestreetAvenueAlley(User profileUser, String newName) {
    streetAvenueAlley.value = newName;
    profileUser.address!.streetAvenueAlley = newName;
    fetchvalue(profileUser);
  }

  void updateoutDoor(User profileUser, String newName) {
    outDoor.value = newName;
    profileUser.address!.outDoor = newName;
    fetchvalue(profileUser);
  }

  void updateinsideDoor(User profileUser, String newName) {
    insideDoor.value = newName;
    profileUser.address!.insideDoor = newName;
    fetchvalue(profileUser);
  }

  void updateneighborhoodDirections(User profileUser, String newName) {
    neighborhoodDirections.value = newName;
    profileUser.address!.neighborhoodDirections = newName;
    fetchvalue(profileUser);
  }

  Future<void> filepicker() async {
    final a = FilePickerWidget();
    await a.pickFile();
  }

  @override
  void onInit() {
    super.onInit();

    tabbarController = TabController(length: 2, vsync: this);

    fetchvalue(profileUser);
  }

  @override
  void onClose() {
    super.onClose();
    tabbarController.dispose();
  }
}
