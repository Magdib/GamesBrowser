import 'package:flutter/material.dart';
import 'package:gamesbrowser/controller/HomePageController.dart';
import 'package:gamesbrowser/core/shared/UINumbers.dart';
import 'package:gamesbrowser/view/Widgets/shared/CustomRaido.dart';
import 'package:gamesbrowser/view/Widgets/shared/DialogButton.dart';
import 'package:get/get.dart';

import '../constant/Colors.dart';

noInternetDialog(void Function()? onConfirm, void Function()? onCancle) {
  return Get.defaultDialog(
    title: "لا يوجد أتصال بالإنترنت",
    titleStyle: Get.textTheme.titleSmall!.copyWith(color: AppColors.black),
    middleText: "الرجاء الأتصال بالإنترنت وإعادة المحاولة",
    middleTextStyle:
        Get.textTheme.bodySmall!.copyWith(color: AppColors.deepgreen),
    barrierDismissible: false,
    confirm: DialogButton(
      text: "إعادة المحاولة",
      onPressed: onConfirm,
    ),
    cancel: DialogButton(
      text: "خروج",
      onPressed: onCancle,
    ),
  );
}

reGetDataDialog() {
  return Get.defaultDialog(
      title: "جارٍ جلب البيانات",
      titleStyle: Get.textTheme.labelMedium,
      content: GetBuilder<HomePageController>(
        builder: (controller) => CircularProgressIndicator(
          value: controller.getDataPercent,
        ),
      ));
}

periodDialog(BuildContext context) {
  return Get.defaultDialog(
      title: "مدة التختيم",
      titleStyle: Theme.of(context).textTheme.labelMedium,
      content: SizedBox(
        height: 150,
        width: UINumbers.deviceW,
        child: GetBuilder<HomePageController>(
          builder: (controller) => ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: 4,
            itemBuilder: (context, index) => Row(
              children: [
                CustomRadio(
                    condition: controller.filterPeriodList[index]["condition"],
                    radius: 30,
                    onTap: () => controller.chooseCompleteTime(index)),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  controller.filterPeriodList[index]["period"],
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
          ),
        ),
      ));
}

settingsSizeDialog(BuildContext context) {
  HomePageController controller = Get.find();
  controller.sizeController = TextEditingController(
      text: controller.filterSize != null ? "${controller.filterSize}" : '');
  return Get.defaultDialog(
      title: "أختر الحجم الذي تريده",
      titleStyle: Theme.of(context).textTheme.labelMedium,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 46,
                child: TextField(
                  controller: controller.sizeController,
                  maxLength: 5,
                  keyboardType: TextInputType.number,
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration: InputDecoration(
                      hintText: "الحجم",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.deepGrey),
                      counterText: ""),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "ميغا بايت",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColors.deepgreen),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "العلاقة مع الحجم المختار:",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 10,
          ),
          GetBuilder<HomePageController>(
            builder: (controller) => ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: 3,
              itemBuilder: (context, index) => Row(
                children: [
                  CustomRadio(
                      condition: controller.filterSizeList[index]["condition"],
                      radius: 30,
                      onTap: () => controller.chooseSizeCondition(index)),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    controller.filterSizeList[index]["relation"],
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      confirm: DialogButton(
        text: "حفظ الرقم",
        onPressed: () => controller.saveSize(),
      ),
      cancel: DialogButton(
        text: "إلغاء الأمر",
        onPressed: () => Get.back(),
      ));
}

netDialog(BuildContext context) {
  return Get.defaultDialog(
      title: "حاجة الأنترنت",
      titleStyle: Theme.of(context).textTheme.labelMedium,
      content: SizedBox(
        height: 110,
        width: UINumbers.deviceW,
        child: GetBuilder<HomePageController>(
          builder: (controller) => ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: 3,
            itemBuilder: (context, index) => Row(
              children: [
                CustomRadio(
                    condition: controller.filterNetList[index]["condition"],
                    radius: 30,
                    onTap: () => controller.chooseNetState(index)),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  controller.filterNetList[index]["State"],
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
          ),
        ),
      ));
}
