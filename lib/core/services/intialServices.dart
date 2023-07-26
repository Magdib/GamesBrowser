import 'package:flutter/material.dart';
import 'package:gamesbrowser/data/model/GamesModel.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import '../Hive/HiveData.dart';

class MyServices extends GetxService {
  late Box dataBox;
  Future<MyServices> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();

    Hive.registerAdapter<GamesModel>(GamesModelAdapter());

    dataBox = await Hive.openBox(HiveBoxes.dataBox);

    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
