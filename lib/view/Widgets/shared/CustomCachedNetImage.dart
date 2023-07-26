import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gamesbrowser/controller/GamesController.dart';
import 'package:gamesbrowser/controller/GamesDetailesController.dart';
import 'package:gamesbrowser/core/constant/Colors.dart';
import 'package:gamesbrowser/core/shared/UINumbers.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CustomCachedNetImage extends StatelessWidget {
  const CustomCachedNetImage({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    //Change Getx Controller Here
    return GetBuilder<GamesController>(
      builder: (controller) => CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => Shimmer.fromColors(
                baseColor: AppColors.lightGrey,
                highlightColor: Colors.white,
                child: Container(
                  color: AppColors.lightGrey,
                  height: 180,
                  width: UINumbers.deviceW,
                ),
              ),
          //Can Re Get is GetxController Variable
          errorWidget: (context, url, error) => controller.canReGet == true
              ? Container(
                  color: AppColors.lightGrey,
                  height: 180,
                  width: UINumbers.deviceW,
                  child: IconButton(
                      onPressed: () => controller.reGetImage(),
                      icon: const Icon(
                        Icons.refresh,
                        size: 40,
                        color: AppColors.white,
                      )),
                )
              : CustomCachedNetImage(
                  imageUrl: imageUrl,
                )),
    );
  }
}

class DetailsCustomCachedNetImage extends StatelessWidget {
  const DetailsCustomCachedNetImage({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    //Change Getx Controller Here
    return GetBuilder<GamesDetailesController>(
      builder: (controller) => CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => Shimmer.fromColors(
                baseColor: AppColors.lightGrey,
                highlightColor: Colors.white,
                child: Container(
                  color: AppColors.lightGrey,
                  height: 200,
                  width: UINumbers.deviceW,
                ),
              ),
          //Can Re Get is GetxController Variable
          errorWidget: (context, url, error) {
            controller.isThereError = true;
            return controller.canReGet == true
                ? Container(
                    color: AppColors.lightGrey,
                    height: 200,
                    width: UINumbers.deviceW,
                    child: IconButton(
                        onPressed: () => controller.reGetImage(),
                        icon: const Icon(
                          Icons.refresh,
                          size: 40,
                          color: AppColors.white,
                        )),
                  )
                : DetailsCustomCachedNetImage(
                    imageUrl: imageUrl,
                  );
          }),
    );
  }
}

class FavCachedNetImage extends StatelessWidget {
  const FavCachedNetImage({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    //Change Getx Controller Here
    return CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => Shimmer.fromColors(
              baseColor: AppColors.lightGrey,
              highlightColor: Colors.white,
              child: Container(
                color: AppColors.lightGrey,
                height: 180,
                width: UINumbers.deviceW,
              ),
            ),
        //Can Re Get is GetxController Variable
        errorWidget: (context, url, error) => Container(
            color: AppColors.lightGrey,
            height: 180,
            width: UINumbers.deviceW,
            child: const Icon(Icons.error)));
  }
}
