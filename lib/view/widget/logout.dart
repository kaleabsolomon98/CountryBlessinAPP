import 'package:countyourblessings/view/user/login_sign_up.dart';
import 'package:countyourblessings/view/widget/verify_emaile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Logout extends StatefulWidget {
  const Logout({Key? key}) : super(key: key);
  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signout"),
      ),
      body: RaisedButton(
        child: const Text("signout"),
        onPressed: () {
          FirebaseAuth.instance.signOut();
          Get.offAll(() => const LoginSignUp());
        },
      ),
    );
  }
}
