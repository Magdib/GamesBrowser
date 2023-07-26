import 'package:flutter/material.dart';
import 'package:gamesbrowser/controller/GamesDetailesController.dart';
import 'package:gamesbrowser/core/constant/ArgumentsNames.dart';
import 'package:gamesbrowser/core/constant/Colors.dart';
import 'package:gamesbrowser/view/Widgets/shared/CustomCachedNetImage.dart';
import 'package:get/get.dart';
import '../Widgets/GamesDetails/DetailsSubTitle.dart';
import '../Widgets/GamesDetails/GameData.dart';
import '../Widgets/GamesDetails/GameDescription.dart';

class GamesdetailsPage extends GetView<GamesDetailesController> {
  const GamesdetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: controller.canDeleteFav == true
          ? GetBuilder<GamesDetailesController>(
              builder: (controller) => FloatingActionButton(
                  backgroundColor: controller.color,
                  elevation: 0,
                  onPressed: () => controller.addToFav(),
                  child: Icon(
                    controller.favouriteIndex != -1
                        ? Icons.star_outlined
                        : Icons.star_border_outlined,
                    color: Colors.white,
                  )))
          : null,
      appBar: AppBar(
        title: Text(
          controller.game.gameName!,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        backgroundColor: controller.color,
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () => controller.watchTrailer(),
            child: GetBuilder<GamesDetailesController>(
              builder: (controller) => Stack(
                alignment: Alignment.center,
                children: [
                  Hero(
                      tag: controller.game.gameImage2!,
                      child: DetailsCustomCachedNetImage(
                          imageUrl:
                              "${ArgumentsNames.uploadFileLink}${controller.game.gameImage2!}")),
                  controller.isThereError == false
                      ? const Icon(
                          Icons.play_arrow,
                          size: 80,
                          color: AppColors.white,
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ),
          const DetailsSubTitle(text: 'البيانات'),
          const GameData(),
          const DetailsSubTitle(text: 'الوصف'),
          const GameDescription(),
        ],
      ),
    );
  }
}
