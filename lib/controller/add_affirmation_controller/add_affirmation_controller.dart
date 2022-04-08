import 'package:get/get.dart';

class AddAffirmationsController extends GetxController {
  final List<SelectTimeModel> timeAvailable = [
    SelectTimeModel(
      icon: 'assets/images/Group 18472.png',
      time: 'Morning',
      iconSize: 37.0,
      isSelected: false,
    ),
    SelectTimeModel(
      icon: 'assets/images/Path 12412.png',
      time: 'Mid-Day',
      iconSize: 30.0,
      isSelected: false,
    ),
    SelectTimeModel(
      icon: 'assets/images/Icon awesome-cloud-moon.png',
      time: 'Night',
      iconSize: 36.0,
      isSelected: false,
    ),
  ];

  List<SelectTimeModel> get getAllTimes => timeAvailable;
  final List<SelectTimeModel> selectedTimes = [];

  void selectTime(
    String icon,
    time,
    double iconSize,
    bool isSelected,
    int index,
  ) {
    var data = getAllTimes[index];
    data.isSelected = !data.isSelected!;
    if (data.isSelected == true) {
      selectedTimes.add(
        SelectTimeModel(
          icon: icon,
          time: time,
          iconSize: iconSize,
          isSelected: true,
        ),
      );
    } else if (data.isSelected != true) {
      selectedTimes.removeWhere((element) => element.time == data.time);
    }
    update();
  }
}

class SelectTimeModel {
  String? icon, time;
  double? iconSize;
  bool? isSelected;

  SelectTimeModel({
    this.icon,
    this.iconSize,
    this.time,
    this.isSelected,
  });
}
