import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_appbar.dart';
import '../controllers/homepage_controller.dart';
import '../routes.dart';
import '../styles.dart';
import '../utils.dart';

class Homepage extends GetView<HomepageController> {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    botolNiskinButton() {
      return InkWell(
        onTap: () {
          Get.toNamed(RoutePath.botolNiskin);
        },
        child: Container(
          width: size.width * 0.6,
          height: size.width * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width * 0.040),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColor.lightBlue,
                AppColor.secondary.withOpacity(0.6),
              ],
            ),
          ),
          child: Center(
            child: Text(
              "Botol Niskin",
              style: AppTextStyle.primary.copyWith(
                fontSize: 18,
              ),
            ),
          ),
        ),
      );
    }

    botolSensorButton() {
      return InkWell(
        onTap: () {
          Get.toNamed(RoutePath.botolSensor);
        },
        child: Container(
          width: size.width * 0.6,
          height: size.width * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width * 0.040),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColor.teal,
                AppColor.primary.withOpacity(0.6),
              ],
            ),
          ),
          child: Center(
            child: Text(
              "Botol Sensor",
              style: AppTextStyle.secondary.copyWith(
                fontSize: 18,
              ),
            ),
          ),
        ),
      );
    }

    return GetX(
      tag: "Homepage",
      init: controller,
      builder: (controller) {
        utils.println(controller.pageTitle.value);
        return Scaffold(
          appBar: CustomAppBar(
            title: "Pilih pengaturan botol",
            titleStyle: AppTextStyle.secondary,
            useLeading: false,
            backgroundColor: AppColor.darkBlue,
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
            child: Container(
              width: size.width,
              height: size.height,
              margin: EdgeInsets.only(top: size.height * 0.02),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColor.teal,
                    AppColor.lightBlue,
                  ],
                ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(size.width * 0.30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  botolNiskinButton(),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  botolSensorButton(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
