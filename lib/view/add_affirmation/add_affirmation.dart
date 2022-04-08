import 'package:countyourblessings/controller/add_affirmation_controller/add_affirmation_controller.dart';
import 'package:countyourblessings/routes/routes.dart';
import 'package:countyourblessings/view/constant/color.dart';
import 'package:countyourblessings/view/constant/other.dart';
import 'package:countyourblessings/view/widget/custom_app_bar.dart';
import 'package:countyourblessings/view/widget/my_button.dart';
import 'package:countyourblessings/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAffirmation extends StatelessWidget {
  const AddAffirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAffirmationsController>(
      init: AddAffirmationsController(),
      builder: (controller) {
        return Scaffold(
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              CustomAppBar(),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      paddingTop: 20,
                      paddingLeft: 15,
                      paddingBottom: 10,
                      text: 'Create affirmation',
                      size: 22,
                      weight: FontWeight.w600,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      height: 1,
                      color: kGreyColor.withOpacity(0.3),
                    ),
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: [
                          MyText(
                            text: 'Select day',
                            size: 19,
                            weight: FontWeight.w500,
                          ),
                          MyText(
                            text: '(click to open calendar)',
                            size: 16,
                            color: kBlackColor.withOpacity(0.35),
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.spaceEvenly,
                        runAlignment: WrapAlignment.center,
                        runSpacing: 10.0,
                        children: [
                          selectDate('M'),
                          colan,
                          selectDate('11'),
                          colan,
                          selectDate('June'),
                          colan,
                          selectDate('2021'),
                        ],
                      ),
                      MyText(
                        paddingTop: 30,
                        text: 'Affirm your future here',
                        size: 19,
                        weight: FontWeight.w500,
                        paddingBottom: 10.0,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          bottom: 30,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: kLightGreyColor4,
                        ),
                        child: TextFormField(
                          maxLines: 8,
                          style: TextStyle(
                            fontSize: 12,
                            color: kBlackColor.withOpacity(0.62),
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            hintText: 'Write your message here',
                            hintStyle: TextStyle(
                              fontSize: 12,
                              color: kBlackColor.withOpacity(0.62),
                            ),
                            enabledBorder: TextFieldStyling.noBorder,
                            focusedBorder: TextFieldStyling.noBorder,
                          ),
                        ),
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: [
                          MyText(
                            text: 'Select time',
                            size: 19,
                            weight: FontWeight.w500,
                          ),
                          MyText(
                            text: '(one or multiple)',
                            size: 16,
                            color: kBlackColor.withOpacity(0.35),
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          children: List.generate(
                            controller.getAllTimes.length,
                            (index) {
                              var data = controller.getAllTimes[index];
                              return timeSelect(
                                data.icon!,
                                data.time!,
                                data.iconSize!,
                                data.isSelected!,
                                index,
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: SizedBox(
                          width: Get.width * 0.8,
                          child: MyButton(
                            onPressed: () => Get.toNamed(
                              AppLinks.affirmationDone,
                            ),
                            text: 'Continue',
                            elevation: 3,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 120,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget selectDate(String text) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        height: 50,
        width: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: kLightGreyColor3,
        ),
        child: Center(
          child: MyText(
            text: text,
            size: 18,
            weight: FontWeight.w600,
            maxLines: 1,
            overFlow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  Widget timeSelect(
    String icon,
    time,
    double iconSize,
    bool isSelected,
    int index,
  ) {
    return GetBuilder<AddAffirmationsController>(
      init: AddAffirmationsController(),
      builder: (controller) {
        var data = controller.getAllTimes[index];
        return Expanded(
          flex: index == 0
              ? 3
              : index == 1
                  ? 4
                  : 3,
          child: GestureDetector(
            onTap: () => controller.selectTime(
              icon,
              time,
              iconSize,
              isSelected,
              index,
            ),
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: index == 1 ? 15 : 0,
              ),
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: data.isSelected! ? kTertiaryColor : kLightGreyColor3,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    icon,
                    height: iconSize,
                    color: data.isSelected! ? kPrimaryColor : kTertiaryColor,
                  ),
                  MyText(
                    text: time,
                    size: 14,
                    maxLines: 1,
                    color: data.isSelected! ? kPrimaryColor : kBlackColor,
                    overFlow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
