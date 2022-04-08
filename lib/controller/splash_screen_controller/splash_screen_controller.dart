import 'dart:async';
import 'package:countyourblessings/view/on_boarding_screens/on_boarding_screens.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Timer(
      const Duration(seconds: 3),
      () => Get.offAll(
        () => const OnBoardingScreens(),
        transition: Transition.cupertinoDialog,
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<SplashScreenController>();
  }
}
