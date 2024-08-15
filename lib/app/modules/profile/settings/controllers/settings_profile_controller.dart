import 'package:feedbackstation/app/data/models/media_model.dart';
import 'package:feedbackstation/app/data/models/user_model.dart';
import 'package:feedbackstation/app/utils/session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsProfileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabbarController;

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

  void fetchvalue() {
    countinfooaflk.value = 0;
    if (AppSession.user!.avatar != null) {
      countinfooaflk++;
      avatar.value = AppSession.user!.avatar;
    }

    if (AppSession.user!.displayname != null ||
        AppSession.user!.displayname == "") {
      countinfooaflk++;
      displayname.value = AppSession.user!.displayname.toString();
    } else {}

    if (AppSession.user!.firstname != null ||
        AppSession.user!.firstname == "") {
      countinfooaflk++;
      firstname.value = AppSession.user!.firstname.toString();
    } else {}

    if (AppSession.user!.lastname != null && AppSession.user!.lastname != "") {
      countinfooaflk++;
      lastname.value = AppSession.user!.lastname.toString();
    } else {}

    if (AppSession.user!.serialNumber != null &&
        AppSession.user!.serialNumber != "") {
      countinfooaflk++;
      tcno.value = AppSession.user!.serialNumber.toString();
    } else {}

    if (AppSession.user!.phonenumber != null &&
        AppSession.user!.phonenumber != "") {
      countinfooaflk++;
      phone.value = AppSession.user!.phonenumber.toString();
    } else {}

    if (AppSession.user!.email != null && AppSession.user!.email != "") {
      countinfooaflk++;
      mail.value = AppSession.user!.email.toString();
    } else {}

    if (AppSession.user!.gender != null) {
      countinfooaflk++;
      gender.value = AppSession.user!.gender!.val.toString();
    } else {}
    if (AppSession.user!.address!.neighbourhood != null &&
        AppSession.user!.address!.neighbourhood != "") {
      countinfooaflk++;
      neighbourhood.value = AppSession.user!.address!.neighbourhood.toString();
    } else {}

    if (AppSession.user!.address!.streetAvenue != null &&
        AppSession.user!.address!.streetAvenue != "") {
      countinfooaflk++;
      streetAvenue.value = AppSession.user!.address!.streetAvenue.toString();
    } else {}
    if (AppSession.user!.address!.streetAvenueAlley != null &&
        AppSession.user!.address!.streetAvenueAlley != "") {
      countinfooaflk++;
      streetAvenueAlley.value =
          AppSession.user!.address!.streetAvenueAlley.toString();
    } else {}

    if (AppSession.user!.address!.outDoor != null &&
        AppSession.user!.address!.outDoor != "") {
      countinfooaflk++;
      outDoor.value = AppSession.user!.address!.outDoor.toString();
    } else {}
    if (AppSession.user!.address!.insideDoor != null &&
        AppSession.user!.address!.insideDoor != "") {
      countinfooaflk++;
      insideDoor.value = AppSession.user!.address!.insideDoor.toString();
    } else {}
    if (AppSession.user!.address!.neighborhoodDirections != null &&
        AppSession.user!.address!.neighborhoodDirections != "") {
      countinfooaflk++;
      neighborhoodDirections.value =
          AppSession.user!.address!.neighborhoodDirections.toString();
    } else {}
  }

  void updateFirstName(String newName) {
    firstname.value = newName;
    AppSession.user!.firstname = newName;

    fetchvalue();
  }

  void updateLastName(String newName) {
    lastname.value = newName;
    AppSession.user!.lastname = newName;
    fetchvalue();
  }

  void updatetcno(String newName) {
    tcno.value = newName;
    AppSession.user!.serialNumber = newName;
    fetchvalue();
  }

  void updatephone(String newName) {
    phone.value = newName;
    AppSession.user!.phonenumber = newName;
    fetchvalue();
  }

  void updatemail(String newName) {
    mail.value = newName;
    AppSession.user!.email = newName;
    fetchvalue();
  }

  void updategender(String newName) {
    // gender.value = newName;
    // AppSession.user!.gender = newName;
  }

  void updateneighbour(String newName) {
    neighbourhood.value = newName;
    AppSession.user!.address!.neighbourhood = newName;
    fetchvalue();
  }

  void updatestreetAvenue(String newName) {
    streetAvenue.value = newName;
    AppSession.user!.address!.streetAvenue = newName;
    fetchvalue();
  }

  void updatestreetAvenueAlley(String newName) {
    streetAvenueAlley.value = newName;
    AppSession.user!.address!.streetAvenueAlley = newName;
    fetchvalue();
  }

  void updateoutDoor(String newName) {
    outDoor.value = newName;
    AppSession.user!.address!.outDoor = newName;
    fetchvalue();
  }

  void updateinsideDoor(String newName) {
    insideDoor.value = newName;
    AppSession.user!.address!.insideDoor = newName;
    fetchvalue();
  }

  void updateneighborhoodDirections(String newName) {
    neighborhoodDirections.value = newName;
    AppSession.user!.address!.neighborhoodDirections = newName;
    fetchvalue();
  }

  @override
  void onInit() {
    super.onInit();

    tabbarController = TabController(length: 4, vsync: this);

    fetchvalue();
  }

  @override
  void onClose() {
    super.onClose();
    tabbarController.dispose();
  }
}
