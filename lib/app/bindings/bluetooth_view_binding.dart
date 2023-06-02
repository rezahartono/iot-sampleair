import 'package:get/get.dart';

import '../controllers/bluetooth_view_controller.dart';

class BluetoothViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BluetoothViewController());
  }
}
