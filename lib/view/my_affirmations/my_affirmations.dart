import 'package:countyourblessings/controller/my_affirmations_controller/my_affirmations_controller.dart';
import 'package:countyourblessings/view/constant/color.dart';
import 'package:countyourblessings/view/widget/custom_app_bar.dart';
import 'package:countyourblessings/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliver_tools/sliver_tools.dart';

class MyAffirmations extends StatelessWidget {
  const MyAffirmations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyAffirmationsController>(
      init: MyAffirmationsController(),
      builder: (controller) {
        return Scaffold(
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
               CustomAppBar(),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                sliver: MultiSliver(
                  pushPinnedChildren: true,
                  children: [
                    SliverPinnedHeader(
                      child: Container(
                        color: kPrimaryColor,
                        child: MyText(
                          paddingTop: 20,
                          paddingBottom: 20,
                          text: 'My Affirmations',
                          size: 22,
                          weight: FontWeight.w600,
                        ),
                      ),
                    ),
                    MultiSliver(
                      pushPinnedChildren: true,
                      children: [
                        affirmationHeader(
                          'assets/images/morning.png',
                          'Morning\nAffirmations',
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              var data =
                                  controller.getMorningAffirmations[index];
                              return customCheckBoxTiles(
                                data.title!,
                                data.subTitle,
                                data.isCompleted!,
                                () => controller.selectMorningAffirmation(
                                  data.title!,
                                  data.subTitle,
                                  data.isCompleted!,
                                  index,
                                ),
                                index,
                              );
                            },
                            childCount:
                                controller.getMorningAffirmations.length,
                          ),
                        ),
                      ],
                    ),
                    MultiSliver(
                      pushPinnedChildren: true,
                      children: [
                        affirmationHeader(
                          'assets/images/evening.png',
                          'Mid-Day\nAffirmations',
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              var data =
                                  controller.getMidDayAffirmations[index];
                              return customCheckBoxTiles(
                                data.title!,
                                data.subTitle,
                                data.isCompleted!,
                                () => controller.selectMidDayAffirmation(
                                  data.title!,
                                  data.subTitle,
                                  data.isCompleted!,
                                  index,
                                ),
                                index,
                              );
                            },
                            childCount: controller.getMidDayAffirmations.length,
                          ),
                        ),
                      ],
                    ),
                    MultiSliver(
                      pushPinnedChildren: true,
                      children: [
                        affirmationHeader(
                          'assets/images/night.png',
                          'Night\nAffirmations',
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              var data = controller.getNightAffirmations[index];
                              return customCheckBoxTiles(
                                data.title!,
                                data.subTitle,
                                data.isCompleted!,
                                () => controller.selectNightAffirmation(
                                  data.title!,
                                  data.subTitle,
                                  data.isCompleted!,
                                  index,
                                ),
                                index,
                              );
                            },
                            childCount: controller.getNightAffirmations.length,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 120,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget affirmationHeader(String bgImage, affirmationType) {
    return SliverPinnedHeader(
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 20,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: Stack(
            children: [
              Image.asset(
                bgImage,
                height: 112,
                width: Get.width,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 15,
                child: Center(
                  child: MyText(
                    text: affirmationType,
                    size: 19,
                    weight: FontWeight.w600,
                    color: kPrimaryColor,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customCheckBoxTiles(
    String title,
    subTitle,
    bool isCompleted,
    VoidCallback onTap,
    int index,
  ) {
    return GetBuilder<MyAffirmationsController>(
      init: MyAffirmationsController(),
      builder: (controller) {
        return Material(
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.only(
              bottom: 20,
            ),
            child: Stack(
              children: [
                ListTile(
                  onTap: onTap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  tileColor: const Color(0xffF5F8FD),
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                width: 2.0,
                                color: kBlackColor,
                              ),
                            ),
                          ),
                          isCompleted
                              ? Positioned(
                                  bottom: 0,
                                  right: -5,
                                  child: Image.asset(
                                    'assets/images/check.png',
                                    height: 28,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ],
                  ),
                  title: MyText(
                    text: title,
                    size: 14,
                    weight: FontWeight.w500,
                  ),
                  subtitle: MyText(
                    text: subTitle,
                    size: 10,
                    color: kBlackColor.withOpacity(0.56),
                  ),
                ),
                isCompleted
                    ? Container(
                        height: 72,
                        decoration: BoxDecoration(
                          color: kPrimaryColor.withOpacity(0.45),
                          borderRadius: BorderRadius.circular(11),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }
}
