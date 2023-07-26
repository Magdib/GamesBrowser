import 'package:flutter/material.dart';
import 'package:gamesbrowser/controller/GamesDetailesController.dart';
import 'package:get/get.dart';

class DetailsSubTitle extends GetView<GamesDetailesController> {
  const DetailsSubTitle({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(text,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: controller.color)),
        ],
      ),
    );
  }
}
