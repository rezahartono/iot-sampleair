import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles.dart';

class BotolNiskinController extends GetxController {
  final pageTitle = RxString("Homepage");
  final selectedBluetooth = RxString("");
  final bluetooths = RxList<String>();
  final isActive = RxBool(false);
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return Icon(
          Icons.check,
          color: AppColor.green,
        );
      }
      return Icon(
        Icons.close,
        color: AppColor.red,
      );
    },
  );
  final MaterialStateProperty<Color?> thumbColor =
      MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return AppColor.green;
      }
      return AppColor.red;
    },
  );

  @override
  void onInit() {
    bluetooths.value = [
      "Bluetooth A",
      "Bluetooth B",
      "Bluetooth C",
    ];
    selectedBluetooth.value = bluetooths.first;
    update();
    super.onInit();
  }
}
