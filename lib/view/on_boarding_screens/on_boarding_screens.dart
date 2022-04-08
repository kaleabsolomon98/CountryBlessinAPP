import 'package:countyourblessings/controller/on_boarding_controller/on_boarding_controller.dart';
import 'package:countyourblessings/model/on_boarding_model/on_boarding_model.dart';
import 'package:countyourblessings/routes/routes.dart';
import 'package:countyourblessings/view/constant/color.dart';
import 'package:countyourblessings/view/constant/other.dart';
import 'package:countyourblessings/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreens extends StatelessWidget {
  const OnBoardingScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
      init: OnBoardingController(),
      builder: (controller) {
        return Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/onBoarding.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: controller.currentIndex,
                  itemCount: controller.onBoardingScreens.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    var data = controller.onBoardingScreens[index];
                    return onBoardingContent(data);
                  },
                ),
                Positioned(
                  right: 15,
                  top: 50,
                  child: GestureDetector(
                    onTap: () => Get.offAllNamed(AppLinks.loginStatus),
                    child: Container(
                      height: 37,
                      width: 67,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: kTertiaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: kTertiaryColor.withOpacity(0.16),
                            offset: const Offset(0, 10),
                            blurRadius: 22,
                          ),
                        ],
                      ),
                      child: Center(
                        child: MyText(
                          text: 'Skip',
                          color: kPrimaryColor,
                          size: 13,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: GestureDetector(
            onTap: () => Get.offAllNamed(AppLinks.loginStatus),
            child: Container(
              margin: const EdgeInsets.only(
                top: 140,
              ),
              height: 77,
              width: 77,
              decoration: gradientBg,
              child: Center(
                child: Image.asset(
                  'assets/images/arrow_forward.png',
                  height: 24,
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              height: 164,
              width: Get.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/bottom_app_bar.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: MyText(
                          text: 'Back',
                          size: 18,
                          fontFamily: 'Montserrat',
                          color: kPrimaryColor,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: SmoothPageIndicator(
                            controller: controller.pageController,
                            count: controller.onBoardingScreens.length,
                            effect: ScrollingDotsEffect(
                              activeStrokeWidth: 2.6,
                              activeDotScale: 1.2,
                              maxVisibleDots: 5,
                              radius: 8,
                              spacing: 8,
                              dotHeight: 12,
                              dotWidth: 12,
                              activeDotColor: kPrimaryColor,
                              dotColor: kPrimaryColor.withOpacity(0.3),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.offAllNamed(AppLinks.loginStatus),
                        child: MyText(
                          text: 'Skip',
                          size: 18,
                          fontFamily: 'Montserrat',
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget onBoardingContent(OnBoardingModel data) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 7,
          ),
          MyText(
            text: data.heading,
            size: 32,
            weight: FontWeight.w600,
            color: kPrimaryColor,
          ),
          MyText(
            text: data.subHeading,
            paddingTop: 10,
            paddingBottom: 50,
            size: 21,
            weight: FontWeight.w500,
            color: kPrimaryColor,
          ),
          MyText(
            align: TextAlign.center,
            text: data.paragraph,
            size: 16,
            color: kPrimaryColor,
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
