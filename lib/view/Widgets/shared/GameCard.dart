import 'package:flutter/material.dart';
import 'package:gamesbrowser/controller/GamesController.dart';
import 'package:gamesbrowser/core/constant/ArgumentsNames.dart';
import 'package:gamesbrowser/data/model/GamesModel.dart';
import 'package:gamesbrowser/routes.dart';
import 'package:get/get.dart';

import '../GamesPage/GamesSubData.dart';
import 'CustomCachedNetImage.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    super.key,
    required this.game,
    required this.color,
    required this.favourite,
    required this.cardFavourite,
  });
  final GamesModel game;
  final Color color;
  final List<GamesModel> favourite;
  final bool cardFavourite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.gameDetailsPageRoute, arguments: {
        ArgumentsNames.game: game,
        ArgumentsNames.catColor: color,
        ArgumentsNames.favourite: favourite,
        ArgumentsNames.canDeleteFav: !cardFavourite
      }),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: cardFavourite == false
                  ? GetBuilder<GamesController>(
                      builder: (controller) => CustomCachedNetImage(
                        imageUrl:
                            "${ArgumentsNames.uploadFileLink}${game.gameImage1!}",
                      ),
                    )
                  : FavCachedNetImage(
                      imageUrl:
                          "${ArgumentsNames.uploadFileLink}${game.gameImage1!}",
                    ),
            ),
            SizedBox(
              height: 50,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GamesSubData(
                      icon: Icons.calendar_month,
                      text: '   ${game.gameDate!.replaceRange(4, null, "")}',
                      color: color,
                    ),
                    GamesSubData(
                      icon: Icons.photo_size_select_actual,
                      text: '  ${game.gameSize} Mb ',
                      color: color,
                    ),
                    GamesSubData(
                      icon: Icons.attach_money,
                      text: '${game.gamePrice}',
                      color: color,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
