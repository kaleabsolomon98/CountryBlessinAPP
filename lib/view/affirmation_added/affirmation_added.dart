import 'package:countyourblessings/routes/routes.dart';
import 'package:countyourblessings/view/constant/color.dart';
import 'package:countyourblessings/view/widget/my_button.dart';
import 'package:countyourblessings/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AffirmationAdded extends StatelessWidget {
  const AffirmationAdded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/affirmation_added.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyText(
                  paddingTop: 50,
                  text: 'Affirmation Added!',
                  size: 34,
                  weight: FontWeight.w600,
                  color: kPrimaryColor,
                ),
                MyText(
                  text: 'In Jesus’ Name',
                  size: 25,
                  color: kPrimaryColor,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 60,
              ),
              child: MyButton(
                onPressed: () => Get.offAllNamed(AppLinks.bottomNavBar),
                text: 'Continue to homepage',
              ),
            )
          ],
        ),
      ),
    );
  }
}
