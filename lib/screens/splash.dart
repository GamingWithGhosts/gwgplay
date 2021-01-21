import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gwgplay/models/user_model.dart';
import 'package:gwgplay/themes/app_theme.dart';
import 'package:gwgplay/utils/navigator.dart';
import 'package:gwgplay/utils/preferences.dart';
import 'package:gwgplay/utils/storage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future checkFirstSeen() async {
    String doneIntro = await preferences.getIntroductionInformation();
    bool _seen = (doneIntro == "seen") ?? false;

    if (_seen) {
      AuthenticatedUser _authenticatedUser = await getUserInfo();
      debugPrint(_authenticatedUser.toString());
      // if (_authenticatedUser != null && (_authenticatedUser.emailID != null && _authenticatedUser.tokenID != null)) {
      if (_authenticatedUser != null) {
        // if (_authenticatedUser.emailID != "" && _authenticatedUser.tokenID != "") {
        //   GWGPlayNavigator.goToDashboard(context);
        // }
        if (_authenticatedUser.emailID != "") {
          GWGPlayNavigator.goToDashboard(context);
        }
      } else {
        GWGPlayNavigator.goToWelcome(context);
      }
    } else {
      await preferences.setIntroductionInformation("seen");
      GWGPlayNavigator.goToIntro(context);
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () => checkFirstSeen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white70),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 50),
                          CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 75.0,
                              backgroundImage:
                                  AssetImage('images/gwgplay-logo.png')),
                          SizedBox(height: 50),
                          Text("GWG Play", style: AppTheme.titleStyle),
                          SizedBox(height: 40),
                          CircularProgressIndicator(),
                          SizedBox(height: 40),
                          Text("Social Network For Gamers",
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: AppTheme.caption,
                              overflow: TextOverflow.fade),
                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "© 2021 Gaming With Ghosts",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: AppTheme.caption,
                ))
          ],
        ),
      ),
    );
  }
}
