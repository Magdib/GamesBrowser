import 'package:flutter/material.dart';
import 'package:gamesbrowser/routes.dart';
import 'package:get/get.dart';

import '../Hive/HiveData.dart';
import '../services/intialServices.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.dataBox.get(Hivekeys.canEnter) == "yes") {
      myServices.dataBox.close();
      return const RouteSettings(name: AppRoutes.mainPageRoute);
    } else {
      myServices.dataBox.close();
      return null;
    }
  }
}
