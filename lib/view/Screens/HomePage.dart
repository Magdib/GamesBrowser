import 'package:flutter/material.dart';
import 'package:gamesbrowser/controller/HomePageController.dart';
import 'package:gamesbrowser/routes.dart';
import 'package:get/get.dart';

import '../../core/constant/Colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      builder: (controller) => Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.deepgreen,
            elevation: 0,
            title: Text(
              controller.pagetitles[controller.currentpage],
              style: Theme.of(context).textTheme.titleMedium,
            ),
            centerTitle: true,
            leading: IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () => Get.toNamed(AppRoutes.filtersPageRoute)),
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentpage,
              onTap: (page) => controller.nextpage(page),
              unselectedItemColor: AppColors.white,
              selectedItemColor: AppColors.lightgreen,
              backgroundColor: AppColors.deepgreen,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.gamepad), label: 'التصنيفات'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.star), label: 'المفضلة')
              ]),
          body: controller.pages.elementAt(controller.currentpage)),
    );
  }
}
