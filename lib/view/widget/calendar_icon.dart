import 'package:flutter/material.dart';

Widget calendarIcon() {
  return Container(
    height: 47,
    width: 47,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffF55E8D),
            Color(0xff7B2F47),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffF55E8D).withOpacity(0.30),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ]),
    child: Center(
      child: Image.asset(
        'assets/images/Icon awesome-calendar-alt.png',
        height: 19,
      ),
    ),
  );
}