import 'package:countyourblessings/controller/user_controller/user_controller.dart';
import 'package:countyourblessings/routes/routes.dart';
import 'package:countyourblessings/view/constant/color.dart';
import 'package:countyourblessings/view/widget/my_button.dart';
import 'package:countyourblessings/view/widget/my_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../main.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final auth = FirebaseAuth.instance;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();

  signUP() async {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    try {
      await auth.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } 
   // on FirebaseAuthException 
    catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        duration: const Duration(seconds: 2),
      ));
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
              controller: _fNameController,
              labelText: 'First Name',
              hintText: 'Enter Name',
            ),
            MyTextField(
              controller: _lNameController,
              labelText: 'Last Name',
              hintText: 'Enter Name',
            ),
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
                    signUP();
                  },
                  text: 'Sign-up',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            socialLogin(),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => controller.tabController!.animateTo(
                0,
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
                      text: 'Already have an account? ',
                    ),
                    TextSpan(
                      text: 'Login now!',
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
