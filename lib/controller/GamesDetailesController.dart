import 'package:flutter/material.dart';
import 'package:gamesbrowser/core/Hive/HiveData.dart';
import 'package:gamesbrowser/core/constant/ArgumentsNames.dart';
import 'package:gamesbrowser/core/constant/Colors.dart';
import 'package:gamesbrowser/core/function/Dialogs.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/function/checkInternet.dart';
import '../data/model/GamesModel.dart';
import '../routes.dart';

class GamesDetailesController extends GetxController {
  Box<GamesModel> favouriteBox = Hive.box(HiveBoxes.favouriteBox);
  GamesModel game = Get.arguments[ArgumentsNames.game];
  final Color color = Get.arguments[ArgumentsNames.catColor];
  final bool canDeleteFav = Get.arguments[ArgumentsNames.canDeleteFav];
  late List<String> info;
  List<GamesModel> favouriteGames = Get.arguments[ArgumentsNames.favourite];
  bool canReGet = true;
  bool? isThereError;
  late int favouriteIndex;
  List<String> description = [
    'الرسومات',
    'أسلوب اللعب',
    'رابط التحميل',
    'التقييم'
  ];
  late List<String> descriptionvalue;
  addToFav() {
    print(favouriteIndex);
    if (favouriteIndex == -1) {
      favouriteIndex = favouriteGames.length;
      favouriteGames.add(game);
      favouriteBox.add(game);
    } else {
      favouriteGames
          .removeWhere((searchGame) => searchGame.gameId == game.gameId);
      favouriteBox.deleteAt(favouriteIndex);
      favouriteIndex = -1;
    }
    print(favouriteIndex);
    update();
  }

  reGetImage() async {
    if (await checkinternet()) {
      isThereError = false;
      canReGet = false;
      update();
    }
    await Future.delayed(const Duration(seconds: 2));
    canReGet = true;
  }

  watchTrailer() async {
    if (await checkinternet()) {
      Get.toNamed(AppRoutes.gameTrailerPageRoute, arguments: {
        ArgumentsNames.thumbnail:
            "${ArgumentsNames.uploadFileLink}${game.gameImage2}",
        ArgumentsNames.youtubeLink: game.gameTrailer
      });
    } else {
      noInternetDialog(() {
        Get.back();
        watchTrailer();
      }, () => Get.back());
    }
  }

  void openDownloadLink() async {
    final Uri _url = Uri.parse(game.gameDownloadlink!);
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      Get.snackbar("حدث خطأ ما",
          "في حالة أستمرار حدوث الخطأ الرجاء التواصل مع الدعم الفني للتطبيق",
          backgroundColor: AppColors.red);
    }
  }

  @override
  void onReady() async {
    await Future.delayed(const Duration(milliseconds: 200));
    if (isThereError != true) {
      isThereError = false;
    }
    update();
    super.onReady();
  }

  @override
  void onInit() {
    final String completeTime;
    final String internetState;
    switch (game.gamePeriod) {
      case "0":
        completeTime = "قصيرة";
        break;
      case "1":
        completeTime = "متوسطة";
        break;
      case "2":
        completeTime = "طويلة";
        break;
      default:
        completeTime = "طويلة جدّاً";
    }
    switch (game.gameInternetstate) {
      case "0":
        internetState = "غير مطلوب";
        break;
      case "1":
        internetState = "عند الدخول فقط";
        break;
      default:
        internetState = "مطلوب طول الوقت";
    }
    info = [
      'تاريخ الإصدار: ${game.gameDate!.replaceRange(4, null, "")}',
      'الحجم: ${game.gameSize} ميغا بايت',
      'السعر: \$${game.gamePrice}',
      'مدة التختيم: $completeTime',
      'الإتصال بالإنترنت: $internetState'
    ];
    descriptionvalue = [
      game.gameGraphics!,
      game.gameGameplay!,
      "تحميل",
      '${game.gameRate}'
    ];
    favouriteIndex = favouriteGames
        .indexWhere((searchGame) => searchGame.gameId == game.gameId);
    super.onInit();
  }
}
