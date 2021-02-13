import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwgplay/utils/user_auth.dart';
import 'package:gwgplay/widgets/elements.dart';
import 'package:gwgplay/models/userFeeds.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

final Color backgroundColor = Color(0xFF2d2d39);

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin {

  List<userFeeds> feeds =[
    userFeeds(dpUrl:'images/ben.jpg',contentUrl:'images/gwgplay-logo.png',userName:'Ben Affleck', time: 'today 9:20 pm', caption: 'OMG ! This GWGPlay is great !',contentType: true),
    userFeeds(dpUrl:'images/chris1.jpg',contentUrl:'images/lifeline.jpg',userName:'Chris Hemsworth', time: 'today 8:30 pm', caption: 'The new lifeline skin is dope !',contentType: true),
    userFeeds(dpUrl:'images/hugh.jpg',contentUrl:'images/kills.jpeg',userName:'Hugh Jackman', time: 'today 06:08 pm', caption: 'Thrashed a few streamers today...17 kills',contentType:true),
    userFeeds(dpUrl:'images/leo.jpeg',contentUrl:'images/amongmeme.jpg',userName:'Leonardo DiCaprio', time: 'today 05:40 pm', caption: 'Only kids play this silly game. LOL',contentType: true),
    userFeeds(dpUrl:'images/gamer.png',contentUrl:'images/apex.mp4',userName:'Karthik R', time: 'today 04:05 pm', caption: 'Hows my new DP?!',contentType: false),

  ];

  Future<bool> _onBackPressed() {
    return showDialog(

          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (context) => exitPrompt(context),
        ) ??
        false;
  }

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
                        leading: Icon(FontAwesomeIcons.users,size: 20,color: Colors.white,),
                        onTap: (){
                          Navigator.pushNamed(context, "/groups");
                        },
                        title: Text('Ghost Groups',style: TextStyle(
                            fontSize: 14,color: Colors.white
                        ),),
                      ),
                      ListTile(
                        leading: Icon(FontAwesomeIcons.user,size: 20,
                        color: Colors.white,),
                        onTap: (){
                          Navigator.pushNamed(context, "/currentUser");
                        },
                        title: Text('Ghost Profile',style: TextStyle(
                          fontSize: 14,color: Colors.white
                        ),),
                      ),
                      ListTile(
                        leading: Icon(FontAwesomeIcons.cogs,size: 20,color: Colors.white,),
                        onTap: (){},
                        title: Text('App Settings',style: TextStyle(
                            fontSize: 14,color: Colors.white
                        ),),
                      ),
                      ListTile(
                        leading: Icon(FontAwesomeIcons.question,size: 20,color: Colors.white,),
                        onTap: (){},
                        title: Text('Help and Feedback',style: TextStyle(
                            fontSize: 14,color: Colors.white
                        ),),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,left: 87),
                  child: Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.copyright,color: Colors.white,size: 15,),
                      SizedBox(width: 3,),
                      Text('2021 Gaming With Ghosts',
                      style: TextStyle(
                        color: Colors.white
                      ),)
                    ],
                  ),
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
                    child: FloatingActionButton(backgroundColor: Colors.redAccent, child: Icon(FontAwesomeIcons.plus), elevation: 0.1,
                        onPressed: () {
                       Navigator.pushNamed(context, "/uploadPost");
                        }),
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
                            color: currentIndex == 0 ? Colors.redAccent : Colors.white,
                          ),
                          onPressed: () {
                            setBottomBarIndex(0);
                          },
                          splashColor: Colors.white,
                        ),
                        IconButton(
                            icon: Icon(
                              FontAwesomeIcons.search,size: 28,
                              color: currentIndex == 1 ? Colors.redAccent : Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/search');
                              setBottomBarIndex(1);
                            }),
                        Container(
                          width: size.width * 0.20,
                        ),
                        IconButton(
                            icon: Icon(
                              FontAwesomeIcons.trophy,
                              size: 28,
                              color: currentIndex == 2 ? Colors.redAccent : Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, "/tournaments");
                              setBottomBarIndex(2);
                            }),
                        IconButton(
                            icon: Icon(
                              FontAwesomeIcons.bell,
                              size: 28,
                              color: currentIndex == 3 ? Colors.redAccent : Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, "/notification");
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
          color: Color(0xFF2D3436),
          child: SafeArea(
              child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Column(
                    children: feeds.map((feed) =>userFeed(
                      feeds: feed,
                    )).toList(),
                  ),
                ),
              ),
              ListView(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF192734),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 1, right: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              IconButton(
                                icon: Icon(
                                  FontAwesomeIcons.bars,size: 22,
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
                                style: GoogleFonts.exo(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),
                              ),
                              SizedBox(width: 50,),
                            ],
                          ),
                        ),
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
          backgroundColor: Color(0xFF2D3436),
          body: Stack(
            children: <Widget>[
              menu(context),
              dashboard(context),
            ],
          ),
        ));
  }
}

class userFeed extends StatefulWidget {
  final userFeeds feeds;
  userFeed({this.feeds});

  @override
  _userFeedState createState() => _userFeedState();
}

class _userFeedState extends State<userFeed> {
  bool isPressed=false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        borderOnForeground: true,
        color: Color(0xFFDFE6E9),
        margin:EdgeInsets.fromLTRB(3,55,3,0) ,
        child: Padding(
          padding: const EdgeInsets.all(8.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:<Widget> [
              Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage(widget.feeds.dpUrl),
                  ),
                  SizedBox(width: 3,),
                  Expanded(
                    child: Text(
                      widget.feeds.userName,
                      style: GoogleFonts.exo(fontWeight: FontWeight.bold,color: Color(0xFF333333))
                    ),
                  ),
                  SizedBox(width: 8,),
                  Text(widget.feeds.time,
                    style:TextStyle(
                        fontSize: 12,
                        color: Color(0xFF333333)
                    ),),
                ],
              ),
              SizedBox(height: 6.0,),
              Text(widget.feeds.caption,
                style: GoogleFonts.openSans(color: Color(0xFF333333),fontSize: 15)
              ),
              widget.feeds.contentType ? Image(
                height:350 ,
                width:350 ,
                image: AssetImage(widget.feeds.contentUrl),
              ):playVideo(videoPlayerController: VideoPlayerController.asset(
                  widget.feeds.contentUrl),
                looping: true,
              ),
              SizedBox(height: 0.0),
               ColoredBox(
                   color: Colors.grey[400],
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FlatButton.icon(onPressed:(){
                          setState(() {
                            isPressed=true;
                          });
                        },
                          label: Text('Like',style: TextStyle(
                              color: Colors.black
                          ),),
                          icon: Icon(isPressed?FontAwesomeIcons.solidHeart:FontAwesomeIcons.heart,
                            color:isPressed?Colors.pinkAccent:Colors.black,
                            size: 23,
                          ),
                        ),
                        FlatButton.icon(onPressed:(){
                          Navigator.pushNamed(context, "/comments");
                        },
                          label: Text('Comment',style: TextStyle(
                              color: Colors.black
                          ),),
                          icon: Icon(FontAwesomeIcons.comment,color: Colors.black,
                          size: 23,),
                        ),
                        FlatButton.icon(onPressed:(){},
                          label: Text('Share',style: TextStyle(
                              color: Colors.black
                          ),),
                          icon: Icon(FontAwesomeIcons.shareSquare,color: Colors.black,
                          size: 23,),
                        ),
                      ],
                    ),
                 ),

              SizedBox(height: 4.0),
            ],
          ),
        ) ,
      ),
    );
  }
}



class playVideo extends StatefulWidget {

  final VideoPlayerController videoPlayerController;
  final bool looping;

  playVideo({
    @required this.videoPlayerController,
    this.looping,
    Key key,
  }) : super(key: key);


  @override
  _playVideoState createState() => _playVideoState();
}

class _playVideoState extends State<playVideo> {

  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    // Wrapper on top of the videoPlayerController
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16 / 9,
      // Prepare the video to be played and display the first frame
      autoInitialize: true,
      looping: widget.looping,
      // Errors can occur for example when trying to play a video
      // from a non-existent URL
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
  


  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16/9,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // IMPORTANT to dispose of all the used resources
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}


class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Color(0xFF192734)
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