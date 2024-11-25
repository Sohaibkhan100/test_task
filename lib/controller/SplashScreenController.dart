import 'dart:async';

import 'package:get/get.dart';
import 'package:sentiment_analysis_evaluation/Routes/Routes.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() async {
    Timer(const Duration(seconds: 2), () async {
      Get.toNamed(AppRoutes.searchScreen);
    });
  }
}
