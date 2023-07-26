import 'package:gamesbrowser/core/constant/ArgumentsNames.dart';
import 'package:get/get.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../core/constant/Colors.dart';

class TrailerController extends GetxController {
  // late YoutubePlayerController ytController;
  // String thumbnail = Get.arguments[ArgumentsNames.thumbnail];
  // final ProgressBarColors progressBarColors = const ProgressBarColors(
  //     handleColor: AppColors.white,
  //     playedColor: AppColors.red,
  //     backgroundColor: AppColors.white);
  @override
  void onInit() {
    // String videoId = YoutubePlayer.convertUrlToId(
    //     Get.arguments[ArgumentsNames.youtubeLink])!;
    // ytController = YoutubePlayerController(
    //   initialVideoId: videoId,
    //   flags: const YoutubePlayerFlags(
    //     autoPlay: true,
    //     mute: false,
    //     controlsVisibleAtStart: true,
    //     loop: false,
    //     useHybridComposition: false,
    //   ),
    // );
    super.onInit();
  }

  @override
  void onClose() {
    // ytController.dispose();
    super.onClose();
  }
}
