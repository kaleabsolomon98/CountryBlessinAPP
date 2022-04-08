import 'package:countyourblessings/model/on_boarding_model/on_boarding_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  var pageController = PageController();

  RxInt currentIndex = 0.obs;
  final List<OnBoardingModel> onBoardingScreens = [
    OnBoardingModel(
      heading: 'Count your Blessings',
      subHeading: 'In Jesus’ Name',
      paragraph:
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diamnonumyeirmod tempor invidu',
    ),
    OnBoardingModel(
      heading: 'Count your Blessings',
      subHeading: 'In Jesus’ Name',
      paragraph:
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diamnonumyeirmod tempor invidu',
    ),
    OnBoardingModel(
      heading: 'Count your Blessings',
      subHeading: 'In Jesus’ Name',
      paragraph:
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diamnonumyeirmod tempor invidu',
    ),
  ].obs;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<OnBoardingController>();
  }
}
