import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gwgplay/utils/preferences.dart';
import 'package:gwgplay/utils/user_auth.dart';

class currentUserProfile extends StatefulWidget {
  @override
  _currentUserProfileState createState() => _currentUserProfileState();
}

class _currentUserProfileState extends State<currentUserProfile> {

String games;
String platforms;
String twitter;
String discord;
String instagram;
String facebook;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white70
        ),
        title: Text('Your Ghost Profile'),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10,left: 10),
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
              height: 25.0,
              color: Colors.white38,
            ),
            Text('GHOST NAME',style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
            ),
            SizedBox(height: 5.0,),
            Text(authenticatedUser.name,style: TextStyle(
              color: Colors.cyan,
              letterSpacing: 2.0,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),),Divider(
              height: 20.0,
              color: Colors.white38,
            ),SizedBox(height: 5.0,),
            Text('GHOST LEVEL',style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
            ),
            SizedBox(height: 5.0,),

            Text('72',style: TextStyle(
              color: Colors.cyan,
              letterSpacing: 2.0,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),),
            Divider(
              height: 20.0,
              color: Colors.white38,
            ),
            SizedBox(height: 5.0,),
            Text('GAMES YOU PLAY',style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
            ),
            SizedBox(height: 10.0,),

            Text('$games',style: TextStyle(
              color: Colors.cyan,
              letterSpacing: 2.0,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),),
            Divider(
              height: 20.0,
              color: Colors.white38,
            ),
            SizedBox(height: 5.0,),
            Text('YOUR PLATFORMS',style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
            ),
            SizedBox(height: 10.0,),

            Text('$platforms',style: TextStyle(
              color: Colors.cyan,
              letterSpacing: 2.0,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),),
            Divider(
              height: 20.0,
              color: Colors.white38,
            ),
            SizedBox(height: 5.0,),
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
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: '@$twitter',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70
                      ),children: [
                        WidgetSpan(
                            child: Icon(FontAwesomeIcons.twitter,color: Colors.blue,size: 19,),
                            alignment: PlaceholderAlignment.middle
                        )
                    ]
                    ),
                  ),
                  SizedBox(width:50 ,),
                  RichText(
                    text: TextSpan(
                        text: '@$instagram',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70
                        ),children: [
                      WidgetSpan(
                          child: Icon(FontAwesomeIcons.instagram,color: Colors.pinkAccent,size: 19,),
                          alignment: PlaceholderAlignment.middle
                      )
                    ]
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: '@$discord',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70
                        ),children: [
                      WidgetSpan(
                          child: Icon(FontAwesomeIcons.discord,color: Colors.indigo[800],size: 19,),
                          alignment: PlaceholderAlignment.middle
                      )
                    ]
                    ),
                  ),
                  SizedBox(width:80 ,),
                  RichText(
                    text: TextSpan(
                        text: '@$facebook',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70
                        ),children: [
                      WidgetSpan(
                          child: Icon(FontAwesomeIcons.facebookSquare,color: Colors.blue[800],size: 19,),
                          alignment: PlaceholderAlignment.middle
                      )
                    ]
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50,),
            Center(
              child: RaisedButton.icon(
                color: Colors.grey[800],
                onPressed:(){
                  Navigator.pushNamed(context, "/editprofile");
                },
                icon: Icon(FontAwesomeIcons.edit,color: Colors.redAccent,),
                label: Text('Edit Profile',style: TextStyle(
                  color: Colors.redAccent
                ),),
              ),
            ),
          ],
        ),
      ),
    );

  }

  @override
  void initState() {
    currentUserProfile();
    loadPreferences();
    //games =  preferences.getApplicationSavedInformation('games');
    super.initState();
  }
  Future loadPreferences()async{
    games = await preferences.getApplicationSavedInformation('games');
    platforms = await preferences.getApplicationSavedInformation('platforms');
    twitter = await preferences.getApplicationSavedInformation('twitter');
    discord = await preferences.getApplicationSavedInformation('discord');
    instagram = await preferences.getApplicationSavedInformation('instagram');
    facebook = await preferences.getApplicationSavedInformation('facebook');

    print(games);
  }


}



