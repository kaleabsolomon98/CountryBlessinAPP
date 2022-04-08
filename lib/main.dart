import 'package:countyourblessings/routes/routes.dart';
import 'package:countyourblessings/view/constant/other.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Count Your Blessings',
      themeMode: ThemeMode.light,
      theme: AppStyling.appStyling,
      initialRoute: AppLinks.splashScreen,
      getPages: AppRoutes.pages,
    );
  }
}
