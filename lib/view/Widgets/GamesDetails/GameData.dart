import 'package:flutter/material.dart';
import 'package:gamesbrowser/controller/GamesDetailesController.dart';
import 'package:get/get.dart';

class GameData extends GetView<GamesDetailesController> {
  const GameData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.info.length,
          separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              height: 1,
              color: Colors.grey,
            ),
          ),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 35,
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    title: Text(
                      controller.info[index],
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
