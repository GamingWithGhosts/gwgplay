import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gwgplay/utils/user_auth.dart';

class currentUserProfile extends StatefulWidget {
  @override
  _currentUserProfileState createState() => _currentUserProfileState();
}

class _currentUserProfileState extends State<currentUserProfile> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text('Ghost Profile'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0,30.0,0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(authenticatedUser.imageURL),
                radius: 40.0,
              ),
            ),
            Divider(
              height: 45.0,
              color: Colors.white38,
            ),
            Text('GHOST NAME',style: TextStyle(
              color: Colors.grey[350],
              letterSpacing: 2.0,
            ),
            ),
            SizedBox(height: 10.0,),
            Text(authenticatedUser.name,style: TextStyle(
              color: Colors.cyan,
              letterSpacing: 2.0,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),),Divider(
              height: 30.0,
              color: Colors.white38,
            ),SizedBox(height: 10.0,),
            Text('GHOST LEVEL',style: TextStyle(
              color: Colors.grey[350],
              letterSpacing: 2.0,
            ),
            ),
            SizedBox(height: 10.0,),

            Text('72',style: TextStyle(
              color: Colors.cyan,
              letterSpacing: 2.0,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),),
            Divider(
              height: 30.0,
              color: Colors.white38,
            ),
            SizedBox(height: 10.0,),
            Text('GAMES YOU PLAY',style: TextStyle(
              color: Colors.grey[350],
              letterSpacing: 2.0,
            ),
            ),
            SizedBox(height: 10.0,),

            Text('CSGO,FORTNITE,AMONG US',style: TextStyle(
              color: Colors.cyan,
              letterSpacing: 2.0,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),),
            Divider(
              height: 30.0,
              color: Colors.white38,
            ),
            SizedBox(height: 10.0,),
            Text('YOUR PLATFORMS',style: TextStyle(
              color: Colors.grey[350],
              letterSpacing: 2.0,
            ),
            ),
            SizedBox(height: 10.0,),

            Text('PC,PS5',style: TextStyle(
              color: Colors.cyan,
              letterSpacing: 2.0,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),),
            Divider(
              height: 30.0,
              color: Colors.white38,
            ),
            SizedBox(height: 10.0,),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email_outlined,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10.0,),
                Text('vaibhavkarthik@gmail.com',style: TextStyle(
                    color: Colors.grey[350],
                    fontSize:20.0,
                    letterSpacing: 1.0
                ),),
              ],
            ),
            SizedBox(height: 60,),
            Center(
              child: RaisedButton.icon(
                color: Colors.white,
                onPressed:(){
                  logOut();
                  Navigator.popAndPushNamed(context, '/welcome');
                },
                icon: Icon(FontAwesomeIcons.signOutAlt,color: Colors.black,),
                label: Text('Logout',style: TextStyle(
                  color: Colors.black
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
