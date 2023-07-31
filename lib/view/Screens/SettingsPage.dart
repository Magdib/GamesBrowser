import 'package:flutter/material.dart';
import 'package:gamesbrowser/controller/HomePageController.dart';
import 'package:gamesbrowser/core/function/Dialogs.dart';
import 'package:gamesbrowser/core/function/UIFunctions.dart';
import 'package:gamesbrowser/view/Widgets/FilterPage/SettingsListTile.dart';
import 'package:gamesbrowser/view/Widgets/shared/CustomButton.dart';
import 'package:get/get.dart';

import '../../core/constant/Colors.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      builder: (controller) => WillPopScope(
          onWillPop: () => controller.onWillPop(),
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppColors.deepgreen,
              title: Text(
                'الإعدادات',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              centerTitle: true,
              leading: IconButton(
                onPressed: () => controller.onWillPop(),
                icon: previousPageIcon(),
              ),
              actions: controller.changeSaved
                  ? [
                      IconButton(
                          onPressed: () => controller.resetSettings(),
                          icon: const Icon(Icons.refresh))
                    ]
                  : null,
            ),
            body: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Expanded(
                    child: Column(children: <SettingsListTile>[
                      SettingsListTile(
                        text: "تحديث البيانات الحالية",
                        trailText: controller.updateTime,
                        onTap: () => controller.updateGames(context),
                      ),
                      SettingsListTile(
                        text: "التصنيف حسب الحجم",
                        trailText: controller.sizeText,
                        onTap: () => settingsSizeDialog(context),
                      ),
                      SettingsListTile(
                        text: "التصنيف حسب مدة التختيم",
                        trailText: controller.completeText,
                        onTap: () => periodDialog(context),
                      ),
                      SettingsListTile(
                        text: "التصنيف حسب حاجة الإنترنت",
                        trailText: controller.netText,
                        onTap: () => netDialog(context),
                      ),
                    ]),
                  ),
                  CustomButton(
                    text: controller.changeSaved == false
                        ? "تفعيل التصنيفات"
                        : "التصنيفات مفعلة",
                    onPressed: controller.changeSaved == false
                        ? () => controller.saveSettings()
                        : null,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
