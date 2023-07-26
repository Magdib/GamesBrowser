import 'package:flutter/material.dart';
import 'package:gamesbrowser/controller/HomePageController.dart';
import 'package:gamesbrowser/core/constant/Colors.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController(), permanent: true);
    return Scaffold(
      backgroundColor: AppColors.deepgreen,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  'متصفح الألعاب',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Lottie.asset('images/splash.json'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
