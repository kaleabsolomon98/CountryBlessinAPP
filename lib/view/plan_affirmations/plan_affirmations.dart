import 'package:countyourblessings/routes/routes.dart';
import 'package:countyourblessings/view/constant/color.dart';
import 'package:countyourblessings/view/pop_up/select_time.dart';
import 'package:countyourblessings/view/widget/calendar_icon.dart';
import 'package:countyourblessings/view/widget/custom_app_bar.dart';
import 'package:countyourblessings/view/widget/horizontal_calendar.dart';
import 'package:countyourblessings/view/widget/my_button.dart';
import 'package:countyourblessings/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlanAffirmations extends StatelessWidget {
  const PlanAffirmations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CustomAppBar(
            haveBackButton: true,
            haveCustomTitle: true,
            title: 'Plan affirmation',
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: MyText(
                    text: 'February, 16',
                    size: 27,
                    weight: FontWeight.w600,
                  ),
                  subtitle: MyText(
                    text: '18 affirmations for Today',
                    size: 15,
                    color: kBlackColor.withOpacity(0.35),
                  ),
                  trailing: calendarIcon(),
                ),
                const SizedBox(
                  height: 10,
                ),
                const HorizontalCalendar(),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 6,
                      child: Image.asset(
                        'assets/images/Group 18480.png',
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Get.dialog(
                    const ShowTime(),
                  ),
                  child: MyText(
                    align: TextAlign.center,
                    paddingTop: 10.0,
                    text: 'Tap to edit',
                    size: 12,
                    color: kBlackColor.withOpacity(0.34),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 9,
                      child: Column(
                        children: List.generate(
                          3,
                          (index) => PlanTiles(
                            time: '07:00 AM',
                            title: 'I will lose 20 lbs. this year.',
                            subtitle: '1/3 Morning affirmation',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: MyText(
                          text: 'Morning',
                          size: 15,
                          color: kBlackColor.withOpacity(0.35),
                        ),
                      ),
                    ),
                  ],
                ),
                customDivider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 9,
                      child: Column(
                        children: List.generate(
                          3,
                          (index) => PlanTiles(
                            time: '12:00 PM',
                            title: 'I will lose 20 lbs. this year.',
                            subtitle: '1/3 Morning affirmation',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: MyText(
                          text: 'Mid-Day',
                          size: 15,
                          color: kBlackColor.withOpacity(0.35),
                        ),
                      ),
                    ),
                  ],
                ),
                customDivider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 9,
                      child: Column(
                        children: List.generate(
                          3,
                          (index) => PlanTiles(
                            time: '08:00 PM',
                            title: 'I will lose 20 lbs. this year.',
                            subtitle: '1/3 Morning affirmation',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: MyText(
                          text: 'Night',
                          size: 15,
                          color: kBlackColor.withOpacity(0.35),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyButton(
                elevation: 3,
                onPressed: () => Get.toNamed(AppLinks.affirmationAdded),
                text: 'Add affirmation',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customDivider() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 20, top: 5),
      child: Divider(
        color: kGreyColor,
        endIndent: 40,
        indent: 15,
      ),
    );
  }

}

// ignore: must_be_immutable
class PlanTiles extends StatelessWidget {
  PlanTiles({
    Key? key,
    this.time,
    this.title,
    this.subtitle,
  }) : super(key: key);

  String? time, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 15),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: MyText(
              text: '$time',
              size: 15,
            ),
          ),
          Expanded(
            flex: 8,
            child: Material(
              color: Colors.transparent,
              child: ListTile(
                onTap: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                tileColor: const Color(0xffF5F8FD),
                title: MyText(
                  text: '$title',
                  size: 14,
                  weight: FontWeight.w500,
                ),
                subtitle: MyText(
                  text: '$subtitle',
                  size: 10,
                  color: kBlackColor.withOpacity(0.56),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
