import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';

import 'root.dart';
import 'presentation/views/home/controller/home_controller.dart';

void main() {
  setPathUrlStrategy();
  Get.lazyPut(() => HommeController());
  runApp(const Root());
}
