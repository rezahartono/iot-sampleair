import 'package:bismillah_ta/app/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

import '../styles.dart';

class BluetoothViewController extends GetxController {
  final pageTitle = RxString("Bluetooth");
  final bluetoothState = Rxn<BluetoothState>();
  final bluetooth = Rx<FlutterBluetoothSerial>(FlutterBluetoothSerial.instance);
  final bluetoothConnection = Rxn<BluetoothConnection>();
  final devices = RxList<BluetoothDevice>();

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
    initialStateOfBluetooth();
    super.onInit();
  }

  initialStateOfBluetooth() async {
    bluetoothState.value = await FlutterBluetoothSerial.instance.state;
    if (bluetoothState.value == BluetoothState.STATE_ON) {
      await getPairedDevices();
    }
    update();
  }

  Future<void> togleActiveBluetooth() async {
    try {
      if (bluetoothState.value == BluetoothState.STATE_OFF) {
        await FlutterBluetoothSerial.instance.requestEnable().then((value) {
          bluetoothState.value = BluetoothState.STATE_ON;
        });
        await getPairedDevices();
      } else {
        await FlutterBluetoothSerial.instance.requestDisable().then((value) {
          bluetoothState.value = BluetoothState.STATE_OFF;
        });
        devices.value = [];
      }
    } catch (e) {
      rethrow;
    }
    update();
  }

  Future<void> getPairedDevices() async {
    try {
      devices.value = await bluetooth.value.getBondedDevices();
    } on PlatformException {
      utils.println("Error");
    }
  }

  connect(BluetoothDevice toConnectDevice) async {
    await BluetoothConnection.toAddress(toConnectDevice.address)
        .then((connection) {
      bluetoothConnection.value = connection;
      bluetoothConnection.value?.input?.listen(null).onDone(() {});
    }).catchError((error) {});
    await getPairedDevices();
  }

  disconnect() async {
    await bluetoothConnection.value?.close();
    await getPairedDevices();
  }
}
