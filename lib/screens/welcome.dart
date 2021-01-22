import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gwgplay/screens/dashboard.dart';
import 'package:gwgplay/themes/app_colour.dart';
import 'package:gwgplay/models/user_model.dart';
import 'package:gwgplay/utils/user_auth.dart';
import 'package:gwgplay/widgets/elements.dart';
import 'package:gwgplay/utils/storage.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (context) => exitPrompt(context),
    ) ??
        false;
  }

  BuildContext _scaffoldContext;
  bool _isLoading = false;

  Future _checkLoginStatus() async {
    AuthenticatedUser _authenticatedUser = await getUserInfo();
    if (_authenticatedUser != null &&
        (_authenticatedUser.emailID != null &&
            _authenticatedUser.tokenID != null)) {
      if (_authenticatedUser.emailID != "" &&
          _authenticatedUser.tokenID != "") {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => DashboardScreen()));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  _loginGoogle() async {
    setState(() {
      _isLoading = true;
    });
    try {
      signInWithGoogle().whenComplete(() {
        setState(() {
          _isLoading = false;
        });
        if (authenticatedUser != null) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => DashboardScreen()));
        } else {
          displaySnackBar(
              _scaffoldContext, "Google Login Cancelled", 3, "RETRY");
        }
      });
    } catch (err) {
      debugPrint(err.toString());
      displaySnackBar(_scaffoldContext, err, 3, "RETRY");
    }
  }

  Widget _label() {
    return Container(
        margin: EdgeInsets.only(top: 40, bottom: 20),
        child: Column(
          children: <Widget>[
            Text(
              "Quick Social Login",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: AppColors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _loginGoogle();
                  },
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage("images/google-logo.png"),
                        backgroundColor: Colors.white,
                        radius: 30.0,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Sign In With Google",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: AppColors.white,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget _title() {
    return CircleAvatar(
        backgroundColor: Colors.indigo[900],
        radius: 75.0,
        backgroundImage: AssetImage('images/gwgplay-logo.png'));
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onBackPressed,
      child: new Scaffold(body: new Builder(builder: (BuildContext context) {
        _scaffoldContext = context;
        return Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.blueGrey[600]]
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      _title(),
                      SizedBox(
                        height: 80,
                      ),
                      _label()
                    ],
                  ),
                ),
              ),
              showProgress(),
            ],
          ),
        );
      })),
    );
  }

  Widget showProgress() {
    if (_isLoading == true) {
      return Center(
          child: SpinKitFadingCircle(
            color: LightColor.black,
            size: 50.0,
          ));
    }
    return Container(height: 0.0, width: 0.0);
  }
}