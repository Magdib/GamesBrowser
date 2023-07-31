import 'package:flutter/material.dart';
import 'package:gamesbrowser/controller/GamesController.dart';
import 'package:get/get.dart';

import '../Widgets/shared/GameCard.dart';

class GamesPage extends GetView<GamesController> {
  const GamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: controller.color,
        elevation: 0,
        title: Text(
          controller.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: ListView.separated(
        itemCount: controller.catGames.length,
        padding: const EdgeInsets.only(top: 8.0, left: 5, right: 5, bottom: 10),
        separatorBuilder: (context, index) => const SizedBox(
          height: 8,
        ),
        itemBuilder: (context, index) {
          return GameCard(
            game: controller.catGames[index],
            favourite: controller.favourite,
            color: controller.color,
            cardFavourite: false,
          );
        },
      ),
    );
  }
}
