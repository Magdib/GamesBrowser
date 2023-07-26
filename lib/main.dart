import 'package:flutter/material.dart';
import 'package:gamesbrowser/core/class/CRUD.dart';
import 'package:gamesbrowser/core/theme/theme.dart';
import 'package:gamesbrowser/routes.dart';
import 'package:get/get.dart';

import 'core/services/intialServices.dart';

void main() async {
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      textDirection: TextDirection.rtl,
      initialBinding: BindingsBuilder.put(() => CRUD()),
      getPages: routes,
    );
  }
}
