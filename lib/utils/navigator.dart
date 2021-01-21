import 'package:flutter/material.dart';

class GWGPlayNavigator {
  static void goToDashboard(BuildContext context) {
    Navigator.pushNamed(context, "/dashboard");
  }

  static void goToWelcome(BuildContext context) {
    Navigator.pushNamed(context, "/welcome");
  }

  static void goToIntro(BuildContext context) {
    Navigator.pushNamed(context, "/intro");
  }
}