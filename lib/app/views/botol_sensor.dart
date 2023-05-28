import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_appbar.dart';
import '../controllers/botol_sensor_controller.dart';
import '../styles.dart';
import '../utils.dart';

class BotolSensor extends GetView<BotolSensorController> {
  const BotolSensor({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    blueToothConnector() {
      return Column(
        children: [
          Text(
            "Penghubung Bluetoooth",
            style: AppTextStyle.primary.copyWith(
              fontSize: 18,
            ),
          ),
        ],
      );
    }

    return GetX(
      tag: "Botol Sensor",
      init: controller,
      builder: (controller) {
        utils.println(controller.pageTitle.value);
        return Scaffold(
          appBar: CustomAppBar(
            title: "Botol Sensor",
            titleStyle: AppTextStyle.secondary,
            backgroundColor: AppColor.darkBlue,
            iconColor: AppColor.secondary,
          ),
          body: Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                blueToothConnector(),
              ],
            ),
          ),
        );
      },
    );
  }
}
