import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/bluetooth_view_binding.dart';
import 'bindings/botol_niskin_binding.dart';
import 'bindings/botol_sensor_binding.dart';
import 'bindings/homepage_binding.dart';
import 'views/bluetooth_view.dart';
import 'views/botol_niskin.dart';
import 'views/botol_sensor.dart';
import 'views/homepage.dart';

abstract class RoutePath {
  static String homepage = "/";
  static String botolNiskin = "/botol-niskin";
  static String botolSensor = "/botol-sensor";
  static String bluetoothView = "/bluetooth-view";
}

class AppRoute implements RoutePath {
  static final pages = [
    GetPage(
      name: RoutePath.homepage,
      page: () => const Homepage(),
      binding: HomepageBinding(),
      curve: Curves.easeInOut,
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RoutePath.botolNiskin,
      page: () => const BotolNiskin(),
      binding: BotolNiskinBinding(),
      curve: Curves.easeInOut,
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RoutePath.botolSensor,
      page: () => const BotolSensor(),
      binding: BotolSensorBinding(),
      curve: Curves.easeInOut,
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RoutePath.bluetoothView,
      page: () => const BluetoothView(),
      binding: BluetoothViewBinding(),
      curve: Curves.easeInOut,
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}
