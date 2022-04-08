import 'dart:async';

import 'package:countyourblessings/view/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifayEmaile extends StatefulWidget {
  const VerifayEmaile({Key? key}) : super(key: key);

  @override
  _VerifayEmaileState createState() => _VerifayEmaileState();
}

class _VerifayEmaileState extends State<VerifayEmaile> {
  bool isEmaileVerified = false;
  bool canResendEmaile = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    ///
    // isEmaileVerified =
    //     FirebaseAuth.instance.currentUser!.emailVerified ?? false;
    if (FirebaseAuth.instance.currentUser == null) {
      isEmaileVerified = false;
    } else {
      isEmaileVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    }
    if (!(isEmaileVerified)) {
      sendVerificationEmaile();

      timer = Timer.periodic(
          const Duration(seconds: 3), (_) => checkEmailVerified());
    }
  }

  Future sendVerificationEmaile() async {
    try {
      FirebaseAuth.instance.authStateChanges().listen((event) {
        if (event != null) {
          print("hellooooooooooooooooooooooo");
          event.sendEmailVerification();
        }
      });
      //onAuthStateChanged.listen((FirebaseUser user) {
      print("errrrrrrrrrrrrrrrr11111111222222222222222");
     // var user = await FirebaseAuth.instance.currentUser!;
      print("kaleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
    //  user.sendEmailVerification();
      print("kaleeeeeeeeeeeeeeeeeeeeeee111111111111111");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print("111111111111111111111111111");
      } else if (e.code == 'email-already-in-use') {
        print("111111111112222222222222222");
      } else if (e.code == 'user-not-found') {
        print("11111111111111111111111111133333333333333333333333");
      } else if (e.code == 'wrong-password') {
        print("11111111111111111111111111144444444444444444444444444");
      }

      print(e.code);
      setState(() {
        canResendEmaile = false;
      });
      await Future.delayed(const Duration(seconds: 5));
      setState(() {
        canResendEmaile = true;
      });
    } catch (e) {
      print("errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
     // print(e);
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //      content: Text(e.toString()),
      //    duration: const Duration(seconds: 2),
      //     ),
      //  );
      //  Utils.showSnackBar(e.toString());
    }
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  Future checkEmailVerified() async {
    try {
      if (FirebaseAuth.instance.currentUser == null) {
      } else {
        await FirebaseAuth.instance.currentUser!.reload();
        setState(() {
          isEmaileVerified = FirebaseAuth.instance.currentUser!.emailVerified;
        });
        if (isEmaileVerified) timer?.cancel();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isEmaileVerified
        ? const BottomNavBar()
        : Scaffold(
            appBar: AppBar(
              title: const Text("Verify Email"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "A verification email has been sent to your email.",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50)),
                      onPressed: () {
                        canResendEmaile ? sendVerificationEmaile() : null;
                      },
                      icon: const Icon(
                        Icons.email,
                        size: 34,
                      ),
                      label: const Text(
                        'Resent Email',
                        style: TextStyle(fontSize: 24),
                      ))
                ],
              ),
            ),
          );
  }
}
