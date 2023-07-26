import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamesbrowser/controller/TrailerController.dart';
import 'package:gamesbrowser/core/constant/Colors.dart';
import 'package:gamesbrowser/view/Widgets/shared/CustomCachedNetImage.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerPage extends GetView<TrailerController> {
  const TrailerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        Get.back();
        return Future.value(false);
      },
      child: Center(
        child: YoutubePlayer(
          controller: controller.ytController,
          showVideoProgressIndicator: true,
          progressIndicatorColor: AppColors.white,
          progressColors: controller.progressBarColors,
          bottomActions: [
            const SizedBox(width: 14.0),
            CurrentPosition(),
            const SizedBox(width: 8.0),
            ProgressBar(
              isExpanded: true,
              colors: controller.progressBarColors,
            ),
            RemainingDuration(),
            FullScreenButton(),
          ],
          onEnded: (metaData) => Get.back(),
          thumbnail: Hero(
              tag: controller.thumbnail,
              child:
                  DetailsCustomCachedNetImage(imageUrl: controller.thumbnail)),
        ),
      ),
    );
  }
}
