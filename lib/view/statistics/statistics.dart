import 'package:countyourblessings/view/constant/color.dart';
import 'package:countyourblessings/view/statistics/graph.dart';
import 'package:countyourblessings/view/widget/calendar_icon.dart';
import 'package:countyourblessings/view/widget/custom_app_bar.dart';
import 'package:countyourblessings/view/widget/my_text.dart';
import 'package:flutter/material.dart';

import 'bar_charts.dart';

class Statistics extends StatelessWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: MyText(
                    text: 'Your Statistics for',
                    size: 27,
                    weight: FontWeight.w600,
                  ),
                  subtitle: MyText(
                    text: 'February, 2021',
                    size: 27,
                    weight: FontWeight.w600,
                  ),
                  trailing: calendarIcon(),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 200,
                  child: Stack(
                    children: [
                      const Graph(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.only(
                            bottom: 10,
                            left: 15,
                            right: 15,
                          ),
                          height: 1,
                          color: kBlackColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        text: 'This Month progress',
                        size: 21,
                      ),
                      MyText(
                        text: '% 80',
                        size: 38,
                        weight: FontWeight.w300,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: const Color(0xffFDFDFE),
                  ),
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Column(
                    children: [
                      BarCharts(),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/Ellipse 4.png',
                                height: 8,
                              ),
                              MyText(
                                text: 'On time',
                                paddingLeft: 10,
                                color: kPurpleColor,
                                size: 9,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/Ellipse 5.png',
                                height: 8,
                              ),
                              MyText(
                                text: 'Missed',
                                paddingLeft: 10,
                                color: kPurpleColor,
                                size: 9,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 120,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
