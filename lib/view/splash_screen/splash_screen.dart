import 'package:countyourblessings/controller/splash_screen_controller/splash_screen_controller.dart';
import 'package:countyourblessings/view/constant/color.dart';
import 'package:countyourblessings/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      init: SplashScreenController(),
      builder: (controller) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                align: TextAlign.center,
                text: 'Count your Blessings',
                size: 28,
                weight: FontWeight.w600,
              ),
              MyText(
                align: TextAlign.center,
                text: 'In Jesus’ Name',
                size: 18,
                color: kGreyColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
