import 'package:gamesbrowser/controller/AuthController.dart';
import 'package:gamesbrowser/controller/GamesController.dart';
import 'package:gamesbrowser/controller/GamesDetailesController.dart';
import 'package:gamesbrowser/controller/TrailerController.dart';
import 'package:gamesbrowser/core/middleware/middleware.dart';
import 'package:gamesbrowser/view/Screens/AuthPage.dart';
import 'package:gamesbrowser/view/Screens/SettingsPage.dart';
import 'package:gamesbrowser/view/Screens/GamesPage.dart';
import 'package:gamesbrowser/view/Screens/HomePage.dart';
import 'package:gamesbrowser/view/Screens/SplashScreen.dart';
import 'package:gamesbrowser/view/Screens/GamesdetailsPage.dart';
import 'package:gamesbrowser/view/Screens/trailerPage.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String mainPageRoute = "/mainPageRoute";
  static const String homePageRoute = "/HomePage";
  static const String gamesPageRoute = "/gamesPage";
  static const String filtersPageRoute = "/SettingsPage";
  static const String gameDetailsPageRoute = "/GameDetailsPage";
  static const String gameTrailerPageRoute = "/gameTrailerPage";
}

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/",
      page: () => const AuthPage(),
      binding: BindingsBuilder.put(() => AuthController()),
      middlewares: [MyMiddleWare()]),
  GetPage(
    name: AppRoutes.mainPageRoute,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: AppRoutes.homePageRoute,
    page: () => const HomePage(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 600),
  ),
  GetPage(
      name: AppRoutes.gamesPageRoute,
      page: () => const GamesPage(),
      binding: BindingsBuilder.put(
        () => GamesController(),
      ),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 600)),
  GetPage(
      name: AppRoutes.filtersPageRoute,
      page: () => const SettingsPage(),
      transition: Transition.upToDown,
      transitionDuration: const Duration(milliseconds: 400)),
  GetPage(
      name: AppRoutes.gameDetailsPageRoute,
      page: () => const GamesdetailsPage(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 600),
      binding: BindingsBuilder.put(() => GamesDetailesController())),
  GetPage(
      name: AppRoutes.gameTrailerPageRoute,
      page: () => const TrailerPage(),
      binding: BindingsBuilder.put(() => TrailerController()))
];
