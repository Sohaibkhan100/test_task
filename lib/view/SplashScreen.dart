
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sentiment_analysis_evaluation/controller/SplashScreenController.dart';

import 'package:sentiment_analysis_evaluation/utils/ImageConstants.dart';
import 'package:sentiment_analysis_evaluation/utils/TextConstants.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashScreenController splashScreenController = Get.put(SplashScreenController());
    return GetBuilder(
      init:splashScreenController,
      builder: (_) {
        return Scaffold(
          body: Container(
            width: 1.sw,
            height: 1.sh,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      ImageConstants.splashImage,
                    ),
                    fit: BoxFit.fill)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(TextConstants.appName,
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
