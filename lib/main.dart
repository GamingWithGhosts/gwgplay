import 'package:flutter/material.dart';
import 'package:gwgplay/screens/chatScreen.dart';
import 'package:gwgplay/screens/commentsScreen.dart';
import 'package:gwgplay/screens/createTeam.dart';
import 'package:gwgplay/screens/currentUserProfile.dart';
import 'package:gwgplay/screens/dashboard.dart';
import 'package:gwgplay/screens/editprofile.dart';
import 'package:gwgplay/screens/ghostGroupsScreen.dart';
import 'package:gwgplay/screens/intro.dart';
import 'package:gwgplay/screens/notificationsScreen.dart';
import 'package:gwgplay/screens/otherUserScreen.dart';
import 'package:gwgplay/screens/searchscreen.dart';
import 'package:gwgplay/screens/splash.dart';
import 'package:gwgplay/screens/teamDetails.dart';
import 'package:gwgplay/screens/tournaments.dart';
import 'package:gwgplay/screens/uploadPostScreen.dart';
import 'package:gwgplay/screens/welcome.dart';
import 'package:gwgplay/themes/app_theme.dart';

// Routes for redirects
var routes = <String, WidgetBuilder>{
  "/currentUser":(BuildContext context) =>currentUserProfile(),
  "/dashboard": (BuildContext context) => DashboardScreen(),
  "/intro": (BuildContext context) => IntroScreen(),
  "/welcome": (BuildContext context) => WelcomeScreen(),
  "/tournaments" : (BuildContext context)=>tournaments(),
  "/search" : (BuildContext context) => searchScreen(),
  "/otheruser" : (BuildContext context) => otherUserProfile(),
  "/editprofile" : (BuildContext context) => editProfile(),
  "/uploadPost" : (BuildContext context) => uploadPostScreen(),
  "/notification" : (BuildContext context) => notificationsScreen(),
  "/groups" : (BuildContext context) => ghostGroupsProfile(),
  "/chats" : (BuildContext context) => ChatScreen(),
  "/comments": (BuildContext context) => commentsScreen(),
  "/teamDetails":(BuildContext context)=>teamDetails(),
  "/createTeam":(BuildContext context)=>createTeam()
};

Future<void> main() async {
  // Ensure the Initialization
  WidgetsFlutterBinding.ensureInitialized();

  runApp(GWGPlayApp());
}

class GWGPlayApp extends StatefulWidget {
  @override
  _GWGPlayAppAppState createState() => _GWGPlayAppAppState();
}

class _GWGPlayAppAppState extends State<GWGPlayApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: SafeArea(top: true, child: SplashScreen()),
        routes: routes);
  }
}
