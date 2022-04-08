import 'package:countyourblessings/view/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:countyourblessings/view/user/login_sign_up.dart';
import 'package:countyourblessings/view/widget/verify_emaile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginStatus extends StatelessWidget {
  const LoginStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text("something went wromg"));
            }
            if (snapshot.hasData) {
              var user = FirebaseAuth.instance.currentUser!.emailVerified;
              if (user) {
                return const BottomNavBar();
              } else {
                return const VerifayEmaile();
              }
            } else {
              return const LoginSignUp();
            }
          }),
    );
  }
}
