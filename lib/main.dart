import 'package:flutter/material.dart';
import 'package:gwgplay/screens/dashboard.dart';
import 'package:gwgplay/screens/intro.dart';
import 'package:gwgplay/screens/splash.dart';
import 'package:gwgplay/screens/welcome.dart';
import 'package:gwgplay/themes/app_theme.dart';

// Routes for redirects
var routes = <String, WidgetBuilder>{
  "/dashboard": (BuildContext context) => DashboardScreen(),
  "/intro": (BuildContext context) => IntroScreen(),
  "/welcome": (BuildContext context) => WelcomeScreen(),
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