import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gwgplay/utils/user_auth.dart';
import 'package:gwgplay/widgets/elements.dart';

final Color backgroundColor = Color(0xFF2d2d39);


class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  Future<bool> _onBackPressed() {
    return showDialog(

          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (context) => exitPrompt(context),
        ) ??
        false;
  }

  BuildContext _scaffoldContext;

  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 200);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  double mainBorderRadius = 0;
  Brightness statusIconColor = Brightness.dark;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.7).animate(_controller);
    _menuScaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1,
    ).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget menuItem({
    IconData iconData,
    String title,
    bool active: false,
  }) {
    return SizedBox(
      width: 0.5 * screenWidth,
      child: Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Icon(
                iconData,
                color: (active) ? Colors.white : Colors.grey,
                size: 22,
              ),
            ),
            Expanded(
              flex: 14,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  "$title",
                  style: TextStyle(
                    color: (active) ? Colors.white : Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 40),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        width: 0.3 * screenWidth,
                        margin: EdgeInsets.only(
                          top: 50,
                          bottom: 10,
                        ),
                        child: ListView(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          children: <Widget>[
                            SizedBox(
                              height: 0.3 * screenWidth,
                              width: 0.3 * screenWidth,
                              child: Container(
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: (authenticatedUser.imageURL == null)
                                          ? AssetImage('images/gwgplay-logo.png')
                                          : NetworkImage(authenticatedUser.imageURL)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: ListView(
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          children: <Widget>[
                            Text(
                              authenticatedUser.name,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              authenticatedUser.emailID,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(FontAwesomeIcons.users,size: 20,),
                        onTap: (){},
                        title: Text('Ghost Groups',style: TextStyle(
                            fontSize: 14
                        ),),
                      ),
                      ListTile(
                        leading: Icon(FontAwesomeIcons.user,size: 20,),
                        onTap: (){
                          Navigator.pushNamed(context, "/currentUser");
                        },
                        title: Text('Ghost Profile',style: TextStyle(
                          fontSize: 14
                        ),),
                      ),
                      ListTile(
                        leading: Icon(FontAwesomeIcons.cogs,size: 20,),
                        onTap: (){},
                        title: Text('App Settings',style: TextStyle(
                            fontSize: 14
                        ),),
                      ),
                      ListTile(
                        leading: Icon(FontAwesomeIcons.question,size: 20,),
                        onTap: (){},
                        title: Text('Help and Feedback',style: TextStyle(
                            fontSize: 14
                        ),),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.copyright),
                  onTap: (){},
                  title: Text('2021 Gaming With Ghosts',style: TextStyle(
                      fontSize: 18
                  ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget bottomBar() {
    final Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment(-1, 1),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 80,
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(backgroundColor: Colors.redAccent, child: Icon(FontAwesomeIcons.plus), elevation: 0.1, onPressed: () {}),
                  ),
                  Container(
                    width: size.width,
                    height:size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.home,
                            size: 28,
                            color: currentIndex == 0 ? Colors.redAccent : Colors.blueGrey,
                          ),
                          onPressed: () {
                            setBottomBarIndex(0);
                          },
                          splashColor: Colors.white,
                        ),
                        IconButton(
                            icon: Icon(
                              FontAwesomeIcons.search,size: 28,
                              color: currentIndex == 1 ? Colors.redAccent : Colors.blueGrey,
                            ),
                            onPressed: () {
                              setBottomBarIndex(1);
                            }),
                        Container(
                          width: size.width * 0.20,
                        ),
                        IconButton(
                            icon: Icon(
                              FontAwesomeIcons.trophy,
                              size: 28,
                              color: currentIndex == 2 ? Colors.redAccent : Colors.blueGrey,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, "/tournaments");
                              setBottomBarIndex(2);
                            }),
                        IconButton(
                            icon: Icon(
                              FontAwesomeIcons.bell,
                              size: 28,
                              color: currentIndex == 3 ? Colors.redAccent : Colors.blueGrey,
                            ),
                            onPressed: () {
                              setBottomBarIndex(3);
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }




  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.5 * screenWidth,
      width: screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          borderRadius: BorderRadius.circular(mainBorderRadius),
          animationDuration: duration,
          color: Color(0xfff4faff),
          child: SafeArea(
              child: Stack(
            children: <Widget>[
              ListView(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.drag_handle,
                                  color: Colors.white70,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (isCollapsed) {
                                      mainBorderRadius = 30;
                                      statusIconColor = Brightness.light;
                                      _controller.forward();
                                    } else {
                                      _controller.reverse();
                                      mainBorderRadius = 0;
                                      statusIconColor = Brightness.dark;
                                    }
                                    isCollapsed = !isCollapsed;
                                  });
                                },
                              ),
                              Text(
                                "Feeds",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 50,),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
              bottomBar(),
            ],
          )),
        ),
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: statusIconColor,
      ),
    );
    return new WillPopScope(
        onWillPop: _onBackPressed,
        child: new Scaffold(
          backgroundColor: Color(0xff343442),
          body: Stack(
            children: <Widget>[
              menu(context),
              dashboard(context),
            ],
          ),
        ));
  }

}
class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20), radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}