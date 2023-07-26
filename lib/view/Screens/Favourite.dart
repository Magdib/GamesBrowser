import 'package:flutter/material.dart';
import 'package:gamesbrowser/controller/HomePageController.dart';
import 'package:gamesbrowser/view/Widgets/shared/GameCard.dart';
import 'package:get/get.dart';
import '../../core/constant/Colors.dart';

class FavouritPage extends GetView<HomePageController> {
  const FavouritPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.favourite.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 5, right: 5),
          child: Dismissible(
              key: UniqueKey(),
              onDismissed: (horizontal) =>
                  controller.removeFromFavourite(index),
              child: GameCard(
                game: controller.favourite[index],
                color: AppColors.deepgreen,
                favourite: controller.favourite,
                cardFavourite: true,
              )),
        );
      },
    );
  }
}
