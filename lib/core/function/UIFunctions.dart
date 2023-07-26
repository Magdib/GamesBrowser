import 'package:flutter/material.dart';
import 'package:gamesbrowser/controller/HomePageController.dart';
import 'package:get/get.dart';

Icon previousPageIcon() {
  HomePageController controller = Get.find();
  return controller.currentpage == 0
      ? const Icon(Icons.games)
      : const Icon(Icons.star);
}
