import 'package:countyourblessings/routes/routes.dart';
import 'package:countyourblessings/view/add_affirmation/add_affirmation.dart';
import 'package:countyourblessings/view/constant/color.dart';
import 'package:countyourblessings/view/constant/other.dart';
import 'package:countyourblessings/view/my_affirmations/my_affirmations.dart';
import 'package:countyourblessings/view/statistics/statistics.dart';
import 'package:countyourblessings/view/widget/logout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var currentIndex = 0;

  final List<Widget> screens = const [
    MyAffirmations(),
    Statistics(),
    AddAffirmation(),
    Logout()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          setState(() {
            currentIndex = 2;
          });
        },
        child: Container(
          margin: const EdgeInsets.only(
            top: 90,
          ),
          height: 77,
          width: 77,
          decoration: gradientBg,
          child: const Icon(
            Icons.add,
            color: kPrimaryColor,
            size: 35,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        shape: const CircularNotchedRectangle(),
        elevation: 0,
        child: Container(
          height: 130,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bottomNavBar.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BItem(
                icon: 'assets/images/Layer 2.png',
                iconSize: 29,
                onTap: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
              ),
              BItem(
                icon: 'assets/images/Icon ionic-ios-stats.png',
                iconSize: 27,
                onTap: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
              ),
              Container(),
              BItem(
                icon: 'assets/images/Icon awesome-clipboard-list.png',
                iconSize: 30,
                onTap: () {
                  setState(() {
                    currentIndex = 2;
                  });
                },
                // onTap: () => Get.toNamed(AppLinks.planAffirmations),
              ),
              BItem(
                icon: 'assets/images/Icon ionic-ios-person.png',
                iconSize: 27,
                onTap: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class BItem extends StatelessWidget {
  BItem({
    Key? key,
    this.icon,
    this.iconSize,
    this.onTap,
  }) : super(key: key);

  String? icon;
  double? iconSize;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: kLightGreyColor.withOpacity(0.1),
        highlightColor: kLightGreyColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(100),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Image.asset(
            '$icon',
            height: iconSize,
          ),
        ),
      ),
    );
  }
}
