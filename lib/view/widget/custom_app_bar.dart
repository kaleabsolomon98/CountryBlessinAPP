import 'package:countyourblessings/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    Key? key,
    this.haveBackButton = false,
    this.haveCustomTitle = false,
    this.title,
  }) : super(key: key);
  String? title;
  bool? haveBackButton,haveCustomTitle;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      centerTitle: true,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          haveBackButton!
              ? GestureDetector(
                  onTap: () => Get.back(),
                  child: Image.asset(
                    'assets/images/Icon ionic-ios-arrow-back.png',
                    height: 24,
                  ),
                )
              : Image.asset(
                  'assets/images/Category.png',
                  height: 26,
                ),
        ],
      ),
      title: haveCustomTitle!?MyText(
        text: '$title',
        size: 22,
      ):MyText(
        text: 'Jan 10, 2021',
        size: 22,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 15,
          ),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'assets/images/Rectangle 16.png',
                height: 34,
                width: 34,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
