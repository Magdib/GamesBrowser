import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gamesbrowser/core/class/enums.dart';
import 'package:gamesbrowser/core/Hive/HiveData.dart';
import 'package:gamesbrowser/core/function/handleData.dart';
import 'package:gamesbrowser/core/function/handleHiveNullState.dart';
import 'package:gamesbrowser/routes.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../core/constant/Colors.dart';
import '../core/function/Dialogs.dart';
import '../data/dataSource/remote/GamesData.dart';
import '../data/model/GamesModel.dart';
import '../data/model/HomePageModel.dart';
import '../view/Screens/CategoriesPage.dart';
import '../view/Screens/Favourite.dart';

class HomePageController extends GetxController {
  late Box dataBox;
  late Box<GamesModel> gamesBox;
  late Box<GamesModel> favouriteBox;
  List<Widget> pages = [const CategoriesPage(), const FavouritPage()];
  TextEditingController? sizeController;
  GamesData gamesData = GamesData(Get.find());
  late bool firstTime;
  int currentpage = 0;
  late String updateTime;
  double getDataPercent = 0;
  int? filterSize;
  String sizeText = "تحديد";
  int filterSizeCondition = 0;
  String completeText = "تحديد";
  int? filterComplete;
  String netText = "تحديد";
  int? filterNet;
  bool changeSaved = false;
  StatusRequest statusRequest = StatusRequest.loading;
  List<String> pagetitles = ['التصنيفات', 'المفضلة'];
  List<GamesModel> games = [];
  List<HomePageModel> category = [
    HomePageModel(title: 'أكشن', image: 'images/Action.jpg'),
    HomePageModel(title: 'رعب', image: 'images/Horror.png'),
    HomePageModel(title: 'البعد الثاني', image: 'images/2D.webp'),
    HomePageModel(title: 'سباق', image: 'images/Race.jpeg'),
    HomePageModel(title: 'ألغاز', image: 'images/Puzzle.jpg'),
    HomePageModel(title: 'سولز', image: 'images/Souls.jpg')
  ];
  List<Map<String, dynamic>> filterPeriodList = [
    {"period": "قصيرة", "condition": false},
    {"period": "متوسطة", "condition": false},
    {"period": "طويلة", "condition": false},
    {"period": "طويلة جدّاً", "condition": false}
  ];
  List<Map<String, dynamic>> filterSizeList = [
    {"relation": "أصغر من", "condition": true},
    {"relation": "أكبر من", "condition": false},
    {"relation": "تقريبيّاً", "condition": false},
  ];
  List<Map<String, dynamic>> filterNetList = [
    {"State": "غير مطلوب", "condition": false},
    {"State": "فقط عند الدخول", "condition": false},
    {"State": "مطلوب", "condition": false},
  ];
  List<GamesModel> favourite = [];

  getGames() async {
    var response = await gamesData.getGames();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List tempGames = response['data'];
        games = tempGames.map((e) => GamesModel.fromJson(e)).toList();

        gamesBox.addAll(games);

        dataBox.put(Hivekeys.firstTime, false);
        splashscreen();
      }
    } else {
      noInternetDialog(() {
        Get.back();
        getGames();
      }, () => exit(0));
    }
  }

  void splashscreen() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    Get.offNamed(AppRoutes.homePageRoute);
  }

  void nextpage(int page) {
    currentpage = page;
    update();
  }

  onWillPop() {
    if (sizeController != null) {
      sizeController!.dispose();
      sizeController = null;
      print("dispose...");
    }
    Get.back();
    return Future.value(false);
  }

  updateGames(BuildContext context) async {
    reGetDataDialog();
    Timer timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      getDataPercent = getDataPercent + 0.05;
      update();
    });
    var response = await gamesData.getGames();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        getDataPercent = 1;
        update();
        List tempGames = response['data'];
        games = tempGames.map((e) => GamesModel.fromJson(e)).toList();
        updateTime = DateTime.now().toString().replaceRange(10, null, "");
        dataBox.put(Hivekeys.lastUpdate, updateTime);
        gamesBox.clear();
        gamesBox.addAll(games);
        await Future.delayed(const Duration(milliseconds: 800));
        Get.back();
      }
    } else {
      Get.back();
      noInternetDialog(
        () {
          Get.back();
          updateGames(context);
        },
        () => Get.back(),
      );
    }
    timer.cancel();
    getDataPercent = 0;
  }

  chooseCompleteTime(int index) {
    filterComplete = index;
    for (int i = 0; i < filterPeriodList.length; i++) {
      filterPeriodList[i]["condition"] = false;
    }
    filterPeriodList[index]["condition"] = true;
    completeText = filterPeriodList[index]['period'];
    update();
    Get.back();
  }

  chooseSizeCondition(int index) {
    filterSizeCondition = index;
    for (int i = 0; i < filterSizeList.length; i++) {
      filterSizeList[i]["condition"] = false;
    }
    filterSizeList[index]["condition"] = true;
    update();
  }

  saveSize() {
    Get.back();
    try {
      filterSize = int.parse(sizeController!.text);
      final String sizeCondition =
          filterSizeList[filterSizeCondition]['relation'];

      sizeText = "$sizeCondition MB $filterSize";
      update();
    } catch (e) {
      Get.snackbar("حدث خطأ ما",
          "يرجى التحقق من أنك قد قمت بإضافة رقم صحيح لا يحتوي على -., أو مساحات فارغة",
          duration: const Duration(seconds: 6), backgroundColor: AppColors.red);
    }
  }

  chooseNetState(int index) {
    filterNet = index;
    for (int i = 0; i < filterNetList.length; i++) {
      filterNetList[i]["condition"] = false;
    }
    filterNetList[index]["condition"] = true;
    netText = filterNetList[index]['State'];
    update();
    Get.back();
  }

  void resetSettings() {
    changeSaved = false;
    sizeText = "تحديد";
    completeText = "تحديد";
    netText = "تحديد";
    sizeController = null;
    filterComplete = null;
    filterNet = null;
    filterSize = null;
    update();
  }

  void saveSettings() {
    changeSaved = true;
    update();
  }

  void removeFromFavourite(int index) {
    try {
      favourite.removeAt(index);
      favouriteBox.deleteAt(index);
    } catch (e) {
      Get.snackbar("حدث خطأ ما",
          "في حالة أستمرار حدوث  الخطأ رجاءً قم بإعادة تشغيل التطبيق",
          backgroundColor: AppColors.red);
    }
  }

  @override
  void onReady() async {
    dataBox = await Hive.openBox(HiveBoxes.dataBox);
    gamesBox = await Hive.openBox(HiveBoxes.gamesBox);
    favouriteBox = await Hive.openBox(HiveBoxes.favouriteBox);
    updateTime = handleHiveNullState(Hivekeys.lastUpdate, "تحديث");
    firstTime = handleHiveNullState(Hivekeys.firstTime, true);
    if (firstTime == true) {
      await getGames();
    } else {
      games.addAll(gamesBox.values);
      favourite.addAll(favouriteBox.values);
      splashscreen();
    }
    super.onReady();
  }
}
