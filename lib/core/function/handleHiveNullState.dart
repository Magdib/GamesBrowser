import 'package:gamesbrowser/core/Hive/HiveData.dart';
import 'package:hive_flutter/hive_flutter.dart';

handleHiveNullState(String hiveKey, dynamic nullValue) {
  dynamic variable;
  Box dataBox = Hive.box(HiveBoxes.dataBox);
  dataBox.get(hiveKey) != null
      ? variable = dataBox.get(hiveKey)
      : variable = nullValue;
  return variable;
}
