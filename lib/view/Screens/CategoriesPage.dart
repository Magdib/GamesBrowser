import 'package:flutter/material.dart';
import 'package:gamesbrowser/core/constant/ArgumentsNames.dart';
import 'package:gamesbrowser/routes.dart';
import 'package:get/get.dart';

import '../../controller/HomePageController.dart';

class CategoriesPage extends GetView<HomePageController> {
  const CategoriesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 200),
        itemCount: controller.category.length,
        itemBuilder: (context, index) {
          return MaterialButton(
            onPressed: () {
              Get.toNamed(
                AppRoutes.gamesPageRoute,
                arguments: {
                  ArgumentsNames.games: controller.games,
                  ArgumentsNames.categoryName: controller.category[index].title,
                  ArgumentsNames.filterSize: controller.filterSize,
                  ArgumentsNames.filterComplete: controller.filterComplete,
                  ArgumentsNames.filterNet: controller.filterNet,
                  ArgumentsNames.sizeCondition: controller.filterSizeCondition,
                  ArgumentsNames.favourite: controller.favourite
                },
              );
            },
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
            child: Stack(alignment: Alignment.center, children: [
              Container(
                height: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(controller.category[index].image),
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5),
                        BlendMode.darken,
                      ),
                      fit: BoxFit.fill,
                    )),
              ),
              Text(
                controller.category[index].title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ]),
          );
        });
  }
}
