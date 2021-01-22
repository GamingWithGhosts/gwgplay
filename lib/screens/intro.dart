import 'package:flutter/material.dart';
import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      color: const Color(0xFF82112E  ),
      heroImagePath: 'images/community.png',
      title: Text("A Gamers Community",
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
      icon: Icon(FontAwesomeIcons.globeAsia),
    ),
    PageModel(
      color: const Color(0xFFFFFFFF  ),
      heroImagePath: 'images/gamer.png',
      title: Text("Connect With Ghosts",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.black,
            fontSize: 34.0,
          )),
      body: Text("Platform To Connect, Learn & Showcase Your Skills",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.black,
            fontSize: 18.0,
          )),
      icon: Icon(FontAwesomeIcons.connectdevelop),
    ),
    PageModel(
      color: const Color(0xFF010049),
      heroImagePath: 'images/trophy-icon-21.jpg',
      title: Text("Tournaments And Prizes",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 34.0,
          )),
      body: Text("Join tournaments and show your skills to win",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          )),
      icon:Icon(FontAwesomeIcons.trophy),
    ),
    PageModel(
      color: const Color(0xFF000000),
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
      icon: Icon(FontAwesomeIcons.handPeace),
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
