import 'package:countyourblessings/controller/user_controller/user_controller.dart';
import 'package:countyourblessings/main.dart';
import 'package:countyourblessings/view/constant/color.dart';
import 'package:countyourblessings/view/constant/other.dart';
import 'package:countyourblessings/view/widget/my_button.dart';
import 'package:countyourblessings/view/widget/my_text.dart';
import 'package:countyourblessings/view/widget/my_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  sIgnIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    try {
      await auth.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      print(e);
      debugPrint(e.toString());
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(),
      builder: (controller) {
        return ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 30,
          ),
          physics: const BouncingScrollPhysics(),
          children: [
            MyTextField(
              controller: _emailController,
              labelText: 'Email',
              hintText: 'Enter Email',
            ),
            MyTextField(
              controller: _passwordController,
              labelText: 'Password',
              hintText: 'Enter Password',
              obSecure: true,
              bottomPadding: 40,
            ),
            Center(
              child: SizedBox(
                width: Get.width * 0.82,
                child: MyButton(
                  onPressed: () {
                    sIgnIn();
                  },
                  // => Get.toNamed(AppLinks.bottomNavBar),
                  text: 'Login',
                ),
              ),
            ),
            MyText(
              paddingTop: 15,
              paddingBottom: 30,
              align: TextAlign.end,
              text: 'Forgot Password?',
              color: kTertiaryColor,
            ),
            socialLogin(),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => controller.tabController!.animateTo(
                1,
                duration: const Duration(
                  milliseconds: 50,
                ),
                curve: Curves.easeIn,
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 12,
                    color: kBlackColor,
                    fontFamily: 'Poppins',
                  ),
                  children: [
                    TextSpan(
                      text: 'Don’t have any account ? ',
                    ),
                    TextSpan(
                      text: 'Create new now!',
                      style: TextStyle(
                        color: kTertiaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 12,
                  color: kBlackColor,
                  fontFamily: 'Poppins',
                ),
                children: [
                  TextSpan(
                    text: 'By signing up, you are agree with our ',
                  ),
                  TextSpan(
                    text: 'Terms & Conditions',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: kTertiaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget socialLogin() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Row(
        children: [
          Flexible(child: customDivider),
          MyText(
            text: 'OR',
            paddingLeft: 15,
            paddingRight: 15,
            color: kLightGreyColor,
          ),
          Flexible(child: customDivider),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/gmail.png',
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(
              'assets/images/Facebook.png',
              height: 50,
            ),
          ),
          Image.asset(
            'assets/images/twitter.png',
            height: 50,
          ),
        ],
      ),
    ],
  );
}
