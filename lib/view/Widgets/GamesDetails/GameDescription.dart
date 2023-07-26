import 'package:flutter/material.dart';
import 'package:gamesbrowser/controller/GamesDetailesController.dart';
import 'package:gamesbrowser/core/constant/Colors.dart';
import 'package:get/get.dart';

class GameDescription extends GetView<GamesDetailesController> {
  const GameDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(top: 10),
              height: 60,
              child: ListTile(
                onTap: index == 2 ? () => controller.openDownloadLink() : null,
                title: index != 2
                    ? Text(
                        controller.descriptionvalue[index],
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    : Text(
                        "تحميل",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: controller.color,
                            decoration: TextDecoration.underline),
                      ),
                leading: CircleAvatar(
                  maxRadius: 40,
                  backgroundColor: controller.color,
                  child: Text(
                    controller.description[index],
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
