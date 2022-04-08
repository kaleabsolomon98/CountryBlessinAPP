import 'package:countyourblessings/view/constant/color.dart';
import 'package:countyourblessings/view/constant/other.dart';
import 'package:countyourblessings/view/widget/my_button.dart';
import 'package:countyourblessings/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';

class AffirmationDone extends StatelessWidget {
  const AffirmationDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.only(top: 40),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/add.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customAppBar(),
                  MyText(
                    align: TextAlign.center,
                    text: 'Hello User!\nTime to write your affirmation',
                    size: 24,
                    weight: FontWeight.w500,
                    color: kPrimaryColor,
                  ),
                  Container(),
                  Container(),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: kLightGreyColor2,
                      ),
                      child: TextFormField(
                        maxLines: 10,
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: countDown(),
                  ),
                  MyButton(
                    elevation: 3,
                    onPressed: () {},
                    text: 'Complete',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget countDown() {
    return Center(
      child: SlideCountdownSeparated(
        duration: const Duration(
          days: 2,
          hours: 2,
          minutes: 30,
        ),
        separatorPadding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: kPrimaryColor,
        ),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: kTertiaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  ListTile customAppBar() {
    return ListTile(
      leading: Image.asset(
        'assets/images/Category.png',
        height: 26,
      ),
      title: MyText(
        align: TextAlign.center,
        text: 'Jan 10, 2021',
        size: 22,
        color: kPrimaryColor,
      ),
      trailing: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          'assets/images/Rectangle 16.png',
          height: 34,
          width: 34,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
