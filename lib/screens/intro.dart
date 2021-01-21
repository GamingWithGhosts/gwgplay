import 'package:flutter/material.dart';
import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:gwgplay/utils/navigator.dart';

class IntroScreen extends StatefulWidget {
  @override
  IntroScreenState createState() {
    return IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  final pageList = [
    PageModel(
      color: const Color(0xFF678FB4),
      heroImagePath: 'images/gwgplay-logo.png',
      title: Text("GWG Play",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 34.0,
          )),
      body: Text("Social Network For Gamers",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 18.0,
          )),
      iconImagePath: 'images/gwgplay-logo.png',
    ),
    PageModel(
      color: const Color(0xFF65B0B4),
      heroImagePath: 'images/gwgplay-logo.png',
      title: Text("GWG Play",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 34.0,
          )),
      body: Text("Platform To Connect, Learn & Showcase Your Skills",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 18.0,
          )),
      iconImagePath: 'images/gwgplay-logo.png',
    ),
    PageModel(
      color: const Color(0xFF9B90BC),
      heroImagePath: 'images/gwgplay-logo.png',
      title: Text("GWG Play",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 34.0,
          )),
      body: Text("Platform For Gaming",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          )),
      iconImagePath: 'images/gwgplay-logo.png',
    ),
    PageModel(
      color: const Color(0xFF9B90BC),
      heroImagePath: 'images/gwgplay-logo.png',
      title: Text("GWG Play",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 34.0,
          )),
      body: Text("Connect. Play. Enjoy.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          )),
      iconImagePath: 'images/gwgplay-logo.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FancyOnBoarding(
        doneButtonText: "GOT IT",
        skipButtonText: "SKIP",
        pageList: pageList,
        onDoneButtonPressed: () => GWGPlayNavigator.goToWelcome(context),
        onSkipButtonPressed: () => GWGPlayNavigator.goToWelcome(context),
      ),
    );
  }
}
