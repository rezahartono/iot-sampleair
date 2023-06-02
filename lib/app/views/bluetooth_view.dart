import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

import '../components/custom_appbar.dart';
import '../controllers/bluetooth_view_controller.dart';
import '../styles.dart';
import '../utils.dart';

class BluetoothView extends GetView<BluetoothViewController> {
  const BluetoothView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    bluetoothConnector() {
      return Column(
        children: [
          Text(
            "Penghubung Bluetoooth",
            style: AppTextStyle.primary.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: size.width * 0.04,
          ),
          Container(
            color: AppColor.secondary,
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      controller.bluetoothState.value == BluetoothState.STATE_ON
                          ? Icons.bluetooth_connected_rounded
                          : Icons.bluetooth_disabled_rounded,
                      color: controller.bluetoothState.value ==
                              BluetoothState.STATE_ON
                          ? AppColor.green
                          : AppColor.red,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Bluetooth",
                      style: AppTextStyle.primary.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Switch(
                  thumbIcon: controller.thumbIcon,
                  value: controller.bluetoothState.value ==
                      BluetoothState.STATE_ON,
                  trackOutlineColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.transparent,
                  ),
                  inactiveThumbColor: AppColor.secondary,
                  activeTrackColor: AppColor.green,
                  inactiveTrackColor: AppColor.red,
                  onChanged: (bool value) async {
                    await controller.togleActiveBluetooth();
                  },
                ),
              ],
            ),
          ),
        ],
      );
    }

    bluetoothDeviceCard(BluetoothDevice device) {
      return Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      device.name ?? "",
                      style: AppTextStyle.primary,
                    ),
                    Text(
                      device.address,
                      style: AppTextStyle.primary,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (device.isConnected) {
                    controller.disconnect();
                  } else {
                    controller.connect(device);
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) =>
                        device.isConnected ? AppColor.red : AppColor.green,
                  ),
                ),
                child: Icon(
                  device.isConnected ? Icons.link_off_sharp : Icons.link_sharp,
                  color: AppColor.secondary,
                ),
              )
            ],
          ),
        ),
      );
    }

    bluetoothDevices() {
      return Expanded(
        child: GridView.count(
          crossAxisCount: 1,
          childAspectRatio: 4.5,
          mainAxisSpacing: 20,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          children: controller.devices
              .map((device) => bluetoothDeviceCard(device))
              .toList(),
        ),
      );
    }

    return GetX(
      tag: "Botol Niskin",
      init: controller,
      builder: (controller) {
        utils.println(controller.pageTitle.value);
        return Scaffold(
          appBar: CustomAppBar(
            title: "Botol Niskin",
            titleStyle: AppTextStyle.secondary,
            backgroundColor: AppColor.darkBlue,
            iconColor: AppColor.secondary,
          ),
          body: Container(
            width: size.width,
            height: size.height,
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                bluetoothConnector(),
                const SizedBox(
                  height: 15,
                ),
                bluetoothDevices(),
              ],
            ),
          ),
        );
      },
    );
  }
}
