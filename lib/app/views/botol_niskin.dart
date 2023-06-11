import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_appbar.dart';
import '../controllers/botol_niskin_controller.dart';
import '../routes.dart';
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
          InkWell(
            onTap: () async {
              var connection = await Get.toNamed(
                RoutePath.bluetoothView,
              );

              if (connection != null) {
                print(connection);
                controller.initBluetooth(connection);
                controller.update();
              }
            },
            child: Container(
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
                        Icons.bluetooth,
                        color: AppColor.primary,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Tampilkan Bluetooth",
                        style: AppTextStyle.primary.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: AppColor.primary,
                  ),
                ],
              ),
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
                onPressed: () {
                  // data "1" bisa di sesuaikan dengan kebutuhan untuk proses membuka
                  controller.sendCommand("1");
                },
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
                onPressed: () {
                  // data "0" bisa di sesuaikan dengan kebutuhan untuk proses menutup
                  controller.sendCommand("0");
                },
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
              // ditambahkan buat menyimpan data dari inputan field
              controller: controller.inputController,
              // end
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () {
              // command mengambil dari data yang di inputkan di field input
              controller.sendCommand(controller.inputController.text);
            },
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
