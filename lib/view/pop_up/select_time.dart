import 'package:countyourblessings/view/constant/color.dart';
import 'package:countyourblessings/view/constant/other.dart';
import 'package:countyourblessings/view/widget/my_text.dart';
import 'package:flutter/material.dart';

class ShowTime extends StatelessWidget {
  const ShowTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: kPrimaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyText(
                  text: 'Select Time',
                  size: 18,
                  paddingBottom: 15.0,
                  weight: FontWeight.w500,
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.spaceEvenly,
                  runAlignment: WrapAlignment.center,
                  runSpacing: 10.0,
                  children: [
                    selectTimeCard('20'),
                    colan,
                    selectTimeCard('11'),
                    colan,
                    selectTimeCard('10'),
                  ],
                ),
                MyText(
                  paddingTop: 15.0,
                  text: 'Edit Message',
                  size: 18,
                  paddingBottom: 10,
                  weight: FontWeight.w500,
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
                    maxLines: 5,
                    style: TextStyle(
                      fontSize: 12,
                      color: kBlackColor.withOpacity(0.62),
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: kBlackColor.withOpacity(0.62),
                      ),
                      enabledBorder: TextFieldStyling.noBorder,
                      focusedBorder: TextFieldStyling.noBorder,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget selectTimeCard(String text) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        width: 50,
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
}
