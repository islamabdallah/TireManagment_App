import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void navigateTo({
  required context,
  required nextScreen,
}) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => nextScreen,
      ),
    );

void navigateAndFinish({
  required context,
  required nextScreen,
}) =>
    Navigator.pushReplacementNamed(
      context,
      nextScreen
    );

void navigateWithTransition({
  required context,
  required nextScreen,
  PageTransitionType transitionType = PageTransitionType.rightToLeft,
}) =>
    Navigator.push(
      context,
      PageTransition(
        type: transitionType,
        duration: const Duration(
          seconds: 0,
          milliseconds: 700,
        ),
        alignment: Alignment.center,
        child: nextScreen,
      ),
    );

void navigateWithTransitionAndFinish({
  required context,
  required nextScreen,
  PageTransitionType transitionType = PageTransitionType.rightToLeft,
}) =>
    Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        type: transitionType,
        duration: const Duration(
          seconds: 0,
          milliseconds: 700,
        ),
        alignment: Alignment.center,
        child: nextScreen,
      ),
      (route) => false,
    );
