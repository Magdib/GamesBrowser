# Diff Details

Date : 2023-07-25 14:48:52

Directory d:\\Programming\\Flutter\\flutter project\\gamesbrowser\\lib

Total : 53 files,  779 codes, 116 comments, 123 blanks, all 1018 lines

[Summary](results.md) / [Details](details.md) / [Diff Summary](diff.md) / Diff Details

## Files
| filename | language | code | comment | blank | total |
| :--- | :--- | ---: | ---: | ---: | ---: |
| [lib/controller/FilterController.dart](/lib/controller/FilterController.dart) | Dart | -24 | 0 | -2 | -26 |
| [lib/controller/GamesController.dart](/lib/controller/GamesController.dart) | Dart | -29 | 61 | 4 | 36 |
| [lib/controller/GamesDetailesController.dart](/lib/controller/GamesDetailesController.dart) | Dart | -56 | 0 | 6 | -50 |
| [lib/controller/HomePageController.dart](/lib/controller/HomePageController.dart) | Dart | 164 | 0 | 12 | 176 |
| [lib/controller/TrailerController.dart](/lib/controller/TrailerController.dart) | Dart | 33 | 0 | 4 | 37 |
| [lib/core/Hive/HiveData.dart](/lib/core/Hive/HiveData.dart) | Dart | 10 | 0 | 2 | 12 |
| [lib/core/class/CRUD.dart](/lib/core/class/CRUD.dart) | Dart | 34 | 27 | 8 | 69 |
| [lib/core/class/enums.dart](/lib/core/class/enums.dart) | Dart | 8 | 0 | 1 | 9 |
| [lib/core/constant/ArgumentsNames.dart](/lib/core/constant/ArgumentsNames.dart) | Dart | 16 | 0 | 1 | 17 |
| [lib/core/constant/Colors.dart](/lib/core/constant/Colors.dart) | Dart | 26 | 1 | 3 | 30 |
| [lib/core/function/Dialogs.dart](/lib/core/function/Dialogs.dart) | Dart | 189 | 0 | 7 | 196 |
| [lib/core/function/UIFunctions.dart](/lib/core/function/UIFunctions.dart) | Dart | 9 | 0 | 2 | 11 |
| [lib/core/function/checkInternet.dart](/lib/core/function/checkInternet.dart) | Dart | 11 | 0 | 2 | 13 |
| [lib/core/function/handleData.dart](/lib/core/function/handleData.dart) | Dart | 8 | 0 | 2 | 10 |
| [lib/core/function/handleHiveNullState.dart](/lib/core/function/handleHiveNullState.dart) | Dart | 10 | 0 | 2 | 12 |
| [lib/core/function/notifications.dart](/lib/core/function/notifications.dart) | Dart | 0 | 19 | 3 | 22 |
| [lib/core/middleware/middleware.dart](/lib/core/middleware/middleware.dart) | Dart | 20 | 0 | 3 | 23 |
| [lib/core/services/intialServices.dart](/lib/core/services/intialServices.dart) | Dart | 18 | 0 | 7 | 25 |
| [lib/core/shared/UINumbers.dart](/lib/core/shared/UINumbers.dart) | Dart | 5 | 0 | 2 | 7 |
| [lib/core/theme/theme.dart](/lib/core/theme/theme.dart) | Dart | 21 | 0 | 3 | 24 |
| [lib/data/dataSource/remote/GamesData.dart](/lib/data/dataSource/remote/GamesData.dart) | Dart | 9 | 0 | 3 | 12 |
| [lib/data/model/GamesModel.dart](/lib/data/model/GamesModel.dart) | Dart | 97 | 0 | 6 | 103 |
| [lib/data/model/GamesModel.g.dart](/lib/data/model/GamesModel.g.dart) | Dart | 78 | 4 | 8 | 90 |
| [lib/data/model/HomePageModel.dart](/lib/data/model/HomePageModel.dart) | Dart | 8 | 0 | 1 | 9 |
| [lib/main.dart](/lib/main.dart) | Dart | 4 | 0 | 1 | 5 |
| [lib/model/Components.dart](/lib/model/Components.dart) | Dart | -14 | 0 | -2 | -16 |
| [lib/model/Model.dart](/lib/model/Model.dart) | Dart | -57 | 0 | -5 | -62 |
| [lib/routes.dart](/lib/routes.dart) | Dart | 53 | 0 | 3 | 56 |
| [lib/view/CategoryPage.dart](/lib/view/CategoryPage.dart) | Dart | -57 | 0 | -5 | -62 |
| [lib/view/Favourite.dart](/lib/view/Favourite.dart) | Dart | -101 | 0 | -3 | -104 |
| [lib/view/FilterPage.dart](/lib/view/FilterPage.dart) | Dart | -51 | 0 | -2 | -53 |
| [lib/view/Games.dart](/lib/view/Games.dart) | Dart | -211 | -1 | -4 | -216 |
| [lib/view/HomePage.dart](/lib/view/HomePage.dart) | Dart | -64 | 0 | -2 | -66 |
| [lib/view/Screens/CategoriesPage.dart](/lib/view/Screens/CategoriesPage.dart) | Dart | 55 | 0 | 4 | 59 |
| [lib/view/Screens/Favourite.dart](/lib/view/Screens/Favourite.dart) | Dart | 29 | 0 | 3 | 32 |
| [lib/view/Screens/GamesPage.dart](/lib/view/Screens/GamesPage.dart) | Dart | 35 | 0 | 4 | 39 |
| [lib/view/Screens/GamesdetailsPage.dart](/lib/view/Screens/GamesdetailsPage.dart) | Dart | 67 | 0 | 3 | 70 |
| [lib/view/Screens/HomePage.dart](/lib/view/Screens/HomePage.dart) | Dart | 39 | 0 | 3 | 42 |
| [lib/view/Screens/SettingsPage.dart](/lib/view/Screens/SettingsPage.dart) | Dart | 76 | 0 | 4 | 80 |
| [lib/view/Screens/SplashScreen.dart](/lib/view/Screens/SplashScreen.dart) | Dart | 31 | 0 | 3 | 34 |
| [lib/view/Screens/TrailerPage.dart](/lib/view/Screens/TrailerPage.dart) | Dart | 44 | 0 | 3 | 47 |
| [lib/view/SplashScreen.dart](/lib/view/SplashScreen.dart) | Dart | -32 | 0 | -3 | -35 |
| [lib/view/Widgets/FilterPage/SettingsListTile.dart](/lib/view/Widgets/FilterPage/SettingsListTile.dart) | Dart | 39 | 0 | 2 | 41 |
| [lib/view/Widgets/GamesDetails/DetailsSubTitle.dart](/lib/view/Widgets/GamesDetails/DetailsSubTitle.dart) | Dart | 26 | 0 | 2 | 28 |
| [lib/view/Widgets/GamesDetails/GameData.dart](/lib/view/Widgets/GamesDetails/GameData.dart) | Dart | 50 | 0 | 3 | 53 |
| [lib/view/Widgets/GamesDetails/GameDescription.dart](/lib/view/Widgets/GamesDetails/GameDescription.dart) | Dart | 59 | 0 | 3 | 62 |
| [lib/view/Widgets/GamesPage/GamesSubData.dart](/lib/view/Widgets/GamesPage/GamesSubData.dart) | Dart | 27 | 0 | 2 | 29 |
| [lib/view/Widgets/shared/CustomButton.dart](/lib/view/Widgets/shared/CustomButton.dart) | Dart | 29 | 0 | 3 | 32 |
| [lib/view/Widgets/shared/CustomCachedNetImage.dart](/lib/view/Widgets/shared/CustomCachedNetImage.dart) | Dart | 115 | 6 | 7 | 128 |
| [lib/view/Widgets/shared/CustomRaido.dart](/lib/view/Widgets/shared/CustomRaido.dart) | Dart | 26 | 0 | 3 | 29 |
| [lib/view/Widgets/shared/DialogButton.dart](/lib/view/Widgets/shared/DialogButton.dart) | Dart | 43 | 0 | 2 | 45 |
| [lib/view/Widgets/shared/GameCard.dart](/lib/view/Widgets/shared/GameCard.dart) | Dart | 84 | 0 | 4 | 88 |
| [lib/view/gamesdetailscreen.dart](/lib/view/gamesdetailscreen.dart) | Dart | -230 | -1 | -3 | -234 |

[Summary](results.md) / [Details](details.md) / [Diff Summary](diff.md) / Diff Details