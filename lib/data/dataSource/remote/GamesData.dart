import 'package:gamesbrowser/core/class/CRUD.dart';

class GamesData {
  CRUD crud;
  GamesData(this.crud);

  getGames() async {
    var response = await crud.getData("games/getGames.php");
    return response.fold((l) => l, (r) => r);
  }
}
