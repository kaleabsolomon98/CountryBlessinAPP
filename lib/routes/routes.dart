import 'package:countyourblessings/view/add_affirmation/add_affirmation.dart';
import 'package:countyourblessings/view/add_affirmation/affirmation_done.dart';
import 'package:countyourblessings/view/affirmation_added/affirmation_added.dart';
import 'package:countyourblessings/view/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:countyourblessings/view/loginstatus.dart';
import 'package:countyourblessings/view/my_affirmations/my_affirmations.dart';
import 'package:countyourblessings/view/on_boarding_screens/on_boarding_screens.dart';
import 'package:countyourblessings/view/plan_affirmations/plan_affirmations.dart';
import 'package:countyourblessings/view/splash_screen/splash_screen.dart';
import 'package:countyourblessings/view/user/login_sign_up.dart';
import 'package:countyourblessings/view/widget/verify_emaile.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: AppLinks.emaileVerification,
      page: () => const VerifayEmaile(),
    ),
    GetPage(
      name: AppLinks.loginStatus,
      page: () => const LoginStatus(),
    ),
    GetPage(
      name: AppLinks.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppLinks.onBoardingScreens,
      page: () => const OnBoardingScreens(),
    ),
    GetPage(
      name: AppLinks.bottomNavBar,
      page: () => const BottomNavBar(),
    ),
    GetPage(
      name: AppLinks.loginSignUp,
      page: () => const LoginSignUp(),
    ),
    GetPage(
      name: AppLinks.planAffirmations,
      page: () => const PlanAffirmations(),
    ),
    GetPage(
      name: AppLinks.myAffirmations,
      page: () => const MyAffirmations(),
    ),
    GetPage(
      name: AppLinks.addAffirmation,
      page: () => const AddAffirmation(),
    ),
    GetPage(
      name: AppLinks.affirmationDone,
      page: () => const AffirmationDone(),
    ),
    GetPage(
      name: AppLinks.affirmationAdded,
      page: () => const AffirmationAdded(),
    ),
  ];
}

class AppLinks {
  static const emaileVerification = '/email_verified';
  static const loginStatus = '/login_status';
  static const splashScreen = '/splash_screen';
  static const onBoardingScreens = '/on_boarding_screens';
  static const bottomNavBar = '/bottom_nav_bar';
  static const loginSignUp = '/login_sign_up';
  static const planAffirmations = '/plan_affirmations';
  static const myAffirmations = '/my_affirmations';
  static const addAffirmation = '/add_affirmation';
  static const affirmationDone = '/affirmation_done';
  static const affirmationAdded = '/affirmation_added';
}
