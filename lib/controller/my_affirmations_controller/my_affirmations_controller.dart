import 'package:countyourblessings/model/my_affirmations_model/my_affirmations_model.dart';
import 'package:get/get.dart';

class MyAffirmationsController extends GetxController {

  List<MyAffirmationsModel> morningAffirmations = [
    MyAffirmationsModel(
      title: 'I will lose 20 lbs. this year.',
      subTitle: '1/3 Morning affirmation',
      isCompleted: false,
    ),
    MyAffirmationsModel(
      title: 'I will lose 20 lbs. this year.',
      subTitle: '1/3 Morning affirmation',
      isCompleted: false,
    ),
    MyAffirmationsModel(
      title: 'I will lose 20 lbs. this year.',
      subTitle: '1/3 Morning affirmation',
      isCompleted: false,
    ),
    MyAffirmationsModel(
      title: 'I will lose 20 lbs. this year.',
      subTitle: '1/3 Morning affirmation',
      isCompleted: false,
    ),
  ];

  List<MyAffirmationsModel> midDayAffirmations = [
    MyAffirmationsModel(
      title: 'I will lose 20 lbs. this year.',
      subTitle: '1/3 Morning affirmation',
      isCompleted: false,
    ),
    MyAffirmationsModel(
      title: 'I will lose 20 lbs. this year.',
      subTitle: '1/3 Morning affirmation',
      isCompleted: false,
    ),
    MyAffirmationsModel(
      title: 'I will lose 20 lbs. this year.',
      subTitle: '1/3 Morning affirmation',
      isCompleted: false,
    ),
    MyAffirmationsModel(
      title: 'I will lose 20 lbs. this year.',
      subTitle: '1/3 Morning affirmation',
      isCompleted: false,
    ),
  ];
  List<MyAffirmationsModel> nightAffirmations = [
    MyAffirmationsModel(
      title: 'I will lose 20 lbs. this year.',
      subTitle: '1/3 Morning affirmation',
      isCompleted: false,
    ),
    MyAffirmationsModel(
      title: 'I will lose 20 lbs. this year.',
      subTitle: '1/3 Morning affirmation',
      isCompleted: false,
    ),
    MyAffirmationsModel(
      title: 'I will lose 20 lbs. this year.',
      subTitle: '1/3 Morning affirmation',
      isCompleted: false,
    ),
    MyAffirmationsModel(
      title: 'I will lose 20 lbs. this year.',
      subTitle: '1/3 Morning affirmation',
      isCompleted: false,
    ),
    MyAffirmationsModel(
      title: 'I will lose 20 lbs. this year.',
      subTitle: '1/3 Morning affirmation',
      isCompleted: false,
    ),
    MyAffirmationsModel(
      title: 'I will lose 20 lbs. this year.',
      subTitle: '1/3 Morning affirmation',
      isCompleted: false,
    ),
    MyAffirmationsModel(
      title: 'I will lose 20 lbs. this year.',
      subTitle: '1/3 Morning affirmation',
      isCompleted: false,
    ),
    MyAffirmationsModel(
      title: 'I will lose 20 lbs. this year.',
      subTitle: '1/3 Morning affirmation',
      isCompleted: false,
    ),
  ];

  List<MyAffirmationsModel> get getMorningAffirmations => morningAffirmations;
  List<MyAffirmationsModel> get getMidDayAffirmations => midDayAffirmations;
  List<MyAffirmationsModel> get getNightAffirmations => nightAffirmations;
  List<MyAffirmationsModel> completedMorningAffirmations = [];
  List<MyAffirmationsModel> completedMidDayAffirmations = [];
  List<MyAffirmationsModel> completedNightAffirmations = [];

  void selectMorningAffirmation(
    String title,
    subTitle,
    bool isCompleted,
    int index,
  ) {
    var data = getMorningAffirmations[index];
    data.isCompleted = !data.isCompleted!;
    if (data.isCompleted == true) {
      completedMorningAffirmations.add(
        MyAffirmationsModel(
          title: title,
          subTitle: subTitle,
          isCompleted: true,
        ),
      );
    }
    update();
  }
  void selectMidDayAffirmation(
      String title,
      subTitle,
      bool isCompleted,
      int index,
      ) {
    var data = getMidDayAffirmations[index];
    data.isCompleted = !data.isCompleted!;
    if (data.isCompleted == true) {
      completedMidDayAffirmations.add(
        MyAffirmationsModel(
          title: title,
          subTitle: subTitle,
          isCompleted: true,
        ),
      );
    }
    update();
  }
  void selectNightAffirmation(
      String title,
      subTitle,
      bool isCompleted,
      int index,
      ) {
    var data = getNightAffirmations[index];
    data.isCompleted = !data.isCompleted!;
    if (data.isCompleted == true) {
      completedNightAffirmations.add(
        MyAffirmationsModel(
          title: title,
          subTitle: subTitle,
          isCompleted: true,
        ),
      );
    }
    update();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<MyAffirmationsController>();
  }
}
