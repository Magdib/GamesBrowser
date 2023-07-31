import 'package:gamesbrowser/core/class/CRUD.dart';

class AuthData {
  CRUD crud;
  AuthData(this.crud);

  checkUser(String code, String name) async {
    var response =
        await crud.postData("users/check.php", {"code": code, "name": name});
    return response.fold((l) => l, (r) => r);
  }
}
