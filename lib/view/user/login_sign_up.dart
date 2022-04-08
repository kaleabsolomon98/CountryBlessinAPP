import 'package:countyourblessings/controller/user_controller/user_controller.dart';
import 'package:countyourblessings/view/constant/color.dart';
import 'package:countyourblessings/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginSignUp extends StatelessWidget {
  const LoginSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(),
      builder: (controller) {
        return Scaffold(
          body: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  centerTitle: true,
                  elevation: 3,
                  forceElevated: true,
                  automaticallyImplyLeading: false,
                  title: MyText(
                    text: 'Count your Blessings',
                    size: 28,
                    weight: FontWeight.w600,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  expandedHeight: 233,
                  pinned: true,
                  flexibleSpace: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    children: [
                      MyText(
                        paddingTop: 90,
                        align: TextAlign.center,
                        text:
                            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod',
                        size: 14,
                      ),
                      MyText(
                        paddingTop: 20,
                        text: 'In Jesus’ Name',
                        size: 21,
                        align: TextAlign.center,
                      ),
                    ],
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size(0, 55),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      height: 55,
                      child: TabBar(
                        controller: controller.tabController,
                        indicatorWeight: 2.74,
                        indicatorColor: kTertiaryColor,
                        indicatorPadding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        tabs: List.generate(
                          controller.tabLabels!.length,
                          (index) => Text(
                            controller.tabLabels![index],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: kBlackColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: controller.tabController,
              physics: const BouncingScrollPhysics(),
              children: controller.tabs!,
            ),
          ),
        );
      },
    );
  }
}
