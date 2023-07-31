import 'package:flutter/material.dart';
import 'package:gamesbrowser/core/class/enums.dart';
import 'package:gamesbrowser/core/function/Dialogs.dart';
import 'package:gamesbrowser/core/function/handleData.dart';
import 'package:gamesbrowser/routes.dart';
import 'package:get/get.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:gamesbrowser/core/Hive/HiveData.dart';
import '../core/constant/Colors.dart';
import '../data/dataSource/remote/AuthData.dart';

class AuthController extends GetxController {
  late Box dataBox;
  AuthData authData = AuthData(Get.find());
  late TextEditingController userName;
  late TextEditingController code;
  bool obscureCode = true;
  bool canCheckUser = false;
  void changeCodeState() {
    obscureCode = !obscureCode;
    update();
  }

  canCheck() {
    if (userName.text.isNotEmpty && code.text.isNotEmpty) {
      canCheckUser = true;
    } else {
      canCheckUser = false;
    }
    update();
  }

  void checkUser() async {
    Get.dialog(
        const Center(
          child: CircularProgressIndicator(
            color: AppColors.deepgreen,
          ),
        ),
        barrierDismissible: false);
    var response = await authData.checkUser(code.text, userName.text);
    StatusRequest statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutes.mainPageRoute);
        dataBox.put(Hivekeys.canEnter, "yes");
      } else {
        Get.back();
        Get.snackbar("خطأ", "الرمز السري خاطئ",
            colorText: AppColors.white, backgroundColor: AppColors.red);
      }
    } else {
      Get.back();
      noInternetDialog(() {
        Get.back();
        checkUser();
      }, () => Get.back());
    }
  }

  @override
  void onInit() {
    userName = TextEditingController();
    code = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() async {
    dataBox = await Hive.openBox(HiveBoxes.dataBox);
    super.onReady();
  }
}
