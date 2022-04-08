import 'package:countyourblessings/controller/statistics_controller/bar_charts_controller.dart';
import 'package:countyourblessings/model/bar_charts_model/bar_charts_model.dart';
import 'package:countyourblessings/view/constant/color.dart';
import 'package:countyourblessings/view/widget/my_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BarCharts extends StatelessWidget {
  BarCharts({Key? key}) : super(key: key);
  var statController = Get.put(StatController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildGraphStat(),
        // _pageIndicatorText(),
        // _previousWeekButton(),
        // _nextWeekButton(),
      ],
    );
  }

  Widget _buildGraphStat() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: 20,
            top: 40,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                text: 'Affirmations done on time',
                size: 12,
                weight: FontWeight.w500,
              ),
              Row(
                children: [
                  MyText(
                    text: 'Last week',
                    size: 11,
                    paddingRight: 5,
                  ),
                  const RotatedBox(
                    quarterTurns: 3,
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: kBlackColor,
                      size: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: _buildWeekIndicators(
              statController.dailyStatList1.call(),
              1,
            ),
          ),
        ),
      ],
    );
  }

  Widget _pageIndicatorText() {
    return Obx(
      () => Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              color: Theme.of(Get.context!).primaryColor,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              child: Text(
                statController.currentWeek.value,
                style: Theme.of(Get.context!).textTheme.bodyText1!.copyWith(
                      color: Colors.white,
                      fontSize: 17.0,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _previousWeekButton() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: RawMaterialButton(
          onPressed: () {
            statController.onPreviousWeek();
          },
          elevation: 2.0,
          fillColor: Theme.of(Get.context!).primaryColor,
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(8.0),
          shape: const CircleBorder(),
        ),
      ),
    );
  }

  Widget _nextWeekButton() {
    return Obx(
      () => Visibility(
        visible: statController.displayNextWeekBtn.value,
        child: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: RawMaterialButton(
              onPressed: () {
                statController.onNextWeek();
              },
              elevation: 2.0,
              fillColor: Theme.of(Get.context!).primaryColor,
              child: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(8.0),
              shape: const CircleBorder(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWeekIndicators(List<DailyStatUiModel> models, int type) {
    if (models.length == 7) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: SizedBox(
          height: 170,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildDayIndicator(models[0], type),
              _buildDayIndicator(models[1], type),
              _buildDayIndicator(models[2], type),
              _buildDayIndicator(models[3], type),
              _buildDayIndicator(models[4], type),
              _buildDayIndicator(models[5], type),
              _buildDayIndicator(models[6], type),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildDayIndicator(DailyStatUiModel model, int type) {
    const width = 4.0;
    return InkWell(
      onTap: () => statController.setSelectedDayPosition(
        model.dayPosition,
        type,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // SizedBox(
          //   width: 48.0,
          //   height: 24.0,
          //   child: Visibility(
          //     visible: model.isSelected,
          //     child: DecoratedBox(
          //       decoration: BoxDecoration(
          //         borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          //         color: Theme.of(Get.context!).colorScheme.secondary,
          //       ),
          //       child: Center(
          //         child: Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 2.0),
          //           child: Text(
          //             '${model.stat} unit',
          //             textAlign: TextAlign.center,
          //             style: const TextStyle(
          //               color: kBlackColor,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            model.day,
            style: const TextStyle(
              color: Color(0xffA2A2C2),
              fontSize: 9,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Expanded(
            child: NeumorphicIndicator(
              width: width,
              style: const IndicatorStyle(
                variant: kNavyBlueColor,
                lightSource: LightSource.bottom,
                accent: kSkinColor,
              ),
              percent: statController.getStatPercentage(
                model.stat,
                type,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getDayDecoratedBox(bool isToday) {
    if (isToday) {
      return BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        color: Theme.of(Get.context!).primaryColor,
      );
    } else {
      return const BoxDecoration();
    }
  }
}
