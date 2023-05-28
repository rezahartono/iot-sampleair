import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_appbar.dart';
import '../controllers/botol_niskin_controller.dart';
import '../styles.dart';
import '../utils.dart';

class BotolNiskin extends GetView<BotolNiskinController> {
  const BotolNiskin({super.key});

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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          controller.isActive.value
                              ? Icons.bluetooth_connected_rounded
                              : Icons.bluetooth_disabled_rounded,
                          color: controller.isActive.value
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
                      value: controller.isActive.value,
                      trackOutlineColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.transparent,
                      ),
                      inactiveThumbColor: AppColor.secondary,
                      activeTrackColor: AppColor.green,
                      inactiveTrackColor: AppColor.red,
                      onChanged: (bool value) {
                        controller.isActive.value = value;
                        controller.update();
                      },
                    ),
                  ],
                ),
                if (controller.isActive.value)
                  Divider(
                    color: AppColor.primary.withOpacity(0.2),
                  ),
                if (controller.isActive.value)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: size.width * 0.14,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: controller.selectedBluetooth.value,
                            icon: const Icon(Icons.arrow_drop_down_rounded),
                            elevation: 16,
                            style: AppTextStyle.primary.copyWith(
                              fontSize: 18,
                            ),
                            underline: Container(
                              height: 0.5,
                              color: AppColor.primary,
                            ),
                            onChanged: (String? value) {
                              controller.selectedBluetooth.value = value ?? '';
                              controller.update();
                            },
                            items: controller.bluetooths.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: AppTextStyle.primary.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => AppColor.green,
                          ),
                        ),
                        child: Icon(
                          Icons.link_sharp,
                          color: AppColor.secondary,
                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),
        ],
      );
    }

    controlTutupBotol() {
      return Column(
        children: [
          Text(
            "Kontrol Tutup Botol Niskin",
            style: AppTextStyle.primary.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Buka",
                  style: AppTextStyle.primary.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.green,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Tutup",
                  style: AppTextStyle.primary.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }

    inputKedalaman() {
      return Column(
        children: [
          Text(
            "Input Kedalaman",
            style: AppTextStyle.primary.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: size.width * 0.45,
            decoration: BoxDecoration(
              color: AppColor.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Input",
              style: AppTextStyle.primary.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
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
                controlTutupBotol(),
                const SizedBox(
                  height: 15,
                ),
                inputKedalaman(),
              ],
            ),
          ),
        );
      },
    );
  }
}
