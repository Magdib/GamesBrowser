import 'package:flutter/material.dart';
import 'package:gamesbrowser/core/constant/ArgumentsNames.dart';
import 'package:gamesbrowser/core/function/checkInternet.dart';
import 'package:get/get.dart';
import '../core/constant/Colors.dart';
import '../data/model/GamesModel.dart';

class GamesController extends GetxController {
  final String title = Get.arguments[ArgumentsNames.categoryName];
  final int? filterSize = Get.arguments[ArgumentsNames.filterSize];
  final int? filterComplete = Get.arguments[ArgumentsNames.filterComplete];
  final int? filterNet = Get.arguments[ArgumentsNames.filterNet];
  final int sizeCondition = Get.arguments[ArgumentsNames.sizeCondition];
  late Color color;
  late List<dynamic> gamesfilter;
  late List<GamesModel> catGames;
  List<GamesModel> favourite = Get.arguments[ArgumentsNames.favourite];
  bool canReGet = true;
  List<GamesModel> games = Get.arguments[ArgumentsNames.games];
  getGamesData() {
    catGames =
        games.where((game) => game.categoriesName!.contains(title)).toList();
    if (filterSize != null) {
      switch (sizeCondition) {
        case 0:
          catGames = catGames
              .where((game) => double.parse(game.gameSize!) < filterSize!)
              .toList();
          break;
        case 1:
          catGames = catGames
              .where((game) => double.parse(game.gameSize!) > filterSize!)
              .toList();
          break;
        default:
          catGames = catGames
              .where((game) =>
                  double.parse(game.gameSize!) < filterSize! + 100 &&
                  double.parse(game.gameSize!) > filterSize! - 100)
              .toList();
      }
    }
    if (filterComplete != null) {
      catGames = catGames
          .where((game) => double.parse(game.gamePeriod!) == filterComplete!)
          .toList();
    }
    if (filterNet != null) {
      catGames = catGames
          .where((game) => double.parse(game.gameInternetstate!) == filterNet!)
          .toList();
    }
    getCatColor();
  }

  reGetImage() async {
    if (await checkinternet()) {
      canReGet = false;
      update();
    }
    await Future.delayed(const Duration(seconds: 2));

    canReGet = true;
  }

  getCatColor() {
    switch (title) {
      case 'رعب':
        color = AppColors.darkred;
        break;
      case 'أكشن':
        color = AppColors.silver;
        break;
      case 'البعد الثاني':
        color = AppColors.purple;
        break;
      case 'سباق':
        color = AppColors.pink;
        break;
      case 'ألغاز':
        color = AppColors.deepgreen;
        break;
      case 'سولز':
        color = AppColors.lightbrown;
        break;
    }
  }

  filterGames() {
    // if (controller3.filterlist[0].istrue == false &&
    //     controller3.filterlist[1].istrue == false &&
    //     controller3.filterlist[2].istrue == false) {
    //   gamesfilter =
    //       controller.games.where((game) => game.oldid.contains(oldid)).toList();
    // } else if (controller3.filterlist[0].istrue == true &&
    //     controller3.filterlist[1].istrue == false &&
    //     controller3.filterlist[2].istrue == false) {
    //   gamesfilter = controller.games
    //       .where((game) => game.oldid.contains(oldid) && game.size < 1000)
    //       .toList();
    // } else if (controller3.filterlist[0].istrue == false &&
    //     controller3.filterlist[1].istrue == true &&
    //     controller3.filterlist[2].istrue == false) {
    //   gamesfilter = controller.games
    //       .where((game) => game.oldid.contains(oldid) && game.date > 2017)
    //       .toList();
    // } else if (controller3.filterlist[0].istrue == false &&
    //     controller3.filterlist[1].istrue == false &&
    //     controller3.filterlist[2].istrue == true) {
    //   gamesfilter = controller.games
    //       .where((game) => game.oldid.contains(oldid) && game.price == 0.0)
    //       .toList();
    // } else if (controller3.filterlist[0].istrue == true &&
    //     controller3.filterlist[1].istrue == true &&
    //     controller3.filterlist[2].istrue == false) {
    //   gamesfilter = controller.games
    //       .where((game) =>
    //           game.oldid.contains(oldid) &&
    //           game.size < 1000 &&
    //           game.date > 2017)
    //       .toList();
    // } else if (controller3.filterlist[0].istrue == true &&
    //     controller3.filterlist[1].istrue == false &&
    //     controller3.filterlist[2].istrue == true) {
    //   gamesfilter = controller.games
    //       .where((game) =>
    //           game.oldid.contains(oldid) &&
    //           game.price == 0.0 &&
    //           game.size < 1000)
    //       .toList();
    // } else if (controller3.filterlist[0].istrue == false &&
    //     controller3.filterlist[1].istrue == true &&
    //     controller3.filterlist[2].istrue == true) {
    //   gamesfilter = controller.games
    //       .where((game) =>
    //           game.oldid.contains(oldid) &&
    //           game.price == 0.0 &&
    //           game.date > 2017)
    //       .toList();
    // } else if (controller3.filterlist[0].istrue == true &&
    //     controller3.filterlist[1].istrue == true &&
    //     controller3.filterlist[2].istrue == true) {
    //   gamesfilter = controller.games
    //       .where((game) =>
    //           game.oldid.contains(oldid) &&
    //           game.price == 0.0 &&
    //           game.date > 2017 &&
    //           game.size < 1000)
    //       .toList();
    // }
  }
  @override
  void onInit() {
    getGamesData();

    super.onInit();
  }
}
