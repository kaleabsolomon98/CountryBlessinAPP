import 'package:countyourblessings/view/user/tabs/login.dart';
import 'package:countyourblessings/view/user/tabs/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController with GetTickerProviderStateMixin {
  var currentTab = 0;
  TabController? tabController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: currentTab,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<UserController>();
  }

  final List<String>? tabLabels = [
    'Login',
    'Sign-up',
  ];
  final List<Widget>? tabs = const [
    Login(),
    SignUp(),
  ];
}
