import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwgplay/utils/preferences.dart';
import 'package:gwgplay/utils/user_auth.dart';




class currentUserProfile extends StatefulWidget {
  @override
  _currentUserProfileState createState() => _currentUserProfileState();
}

class _currentUserProfileState extends State<currentUserProfile> {

  String twitter1;

  Future saveDetails()async{
    await preferences.setApplicationSavedInformation('games', gameController.text);
    await preferences.setApplicationSavedInformation('platforms', platformController.text);
    await preferences.setApplicationSavedInformation('twitter', twitterController.text);
    await preferences.setApplicationSavedInformation('discord', discordController.text);
    await preferences.setApplicationSavedInformation('instagram', instagramController.text);
    await preferences.setApplicationSavedInformation('facebook', facebookController.text);
    print( await preferences.getApplicationSavedInformation('games'));
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


  final gameController = TextEditingController();
  final platformController = TextEditingController(text: 'null');
  final twitterController = TextEditingController(text: 'null');
  final discordController = TextEditingController(text: 'null');
  final instagramController = TextEditingController(text: 'null');
  final facebookController = TextEditingController(text: 'null');


String games;
String platforms;
String twitter;
String discord;
String instagram;
String facebook;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF2D3436),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white70
        ),
        title: Text('Your Ghost Profile'),
        centerTitle: true,
        backgroundColor: Colors.black87,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10,left: 10),
        child: SingleChildScrollView(
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
              Text('GHOST NAME',style: GoogleFonts.exo(
                fontWeight: FontWeight.bold,color: Colors.white,letterSpacing: 1.0
              ),
              ),
              SizedBox(height: 5.0,),
              Text(authenticatedUser.name,style: TextStyle(
                color: Colors.white,
                letterSpacing: 0.5,
                fontSize: 18.0,
              ),),Divider(
                height: 20.0,
                color: Colors.white38,
              ),SizedBox(height: 5.0,),
              Text('GHOST LEVEL',style: GoogleFonts.exo(
                  fontWeight: FontWeight.bold,color: Colors.white,letterSpacing: 1.0
              ),
              ),
              SizedBox(height: 5.0,),
              Text('72',style: TextStyle(
                color: Colors.white,
                letterSpacing: 0.5,
                fontSize: 18.0,
              ),),
              Divider(
                height: 20.0,
                color: Colors.white38,
              ),
              TextField(controller: gameController,
                cursorColor: Colors.white70,
                decoration:InputDecoration(
                  labelText: 'Your Games',
                  labelStyle: GoogleFonts.exo(
                    color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 1.0
                  ),
                  hintText: 'Enter the games you play',
                  hintStyle: TextStyle(
                      color: Colors.grey
                  ),

                ),),
              SizedBox(height: 5.0,),
              TextField(controller: platformController,
                cursorColor: Colors.white70,
                decoration:InputDecoration(
                  labelText: 'Your Platforms',
                  labelStyle: GoogleFonts.exo(
                      color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 1.0,fontSize: 18
                  ),
                  hintText: 'Enter the platform on which you play',
                  hintStyle: TextStyle(
                      color: Colors.grey
                  ),

                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.only(left:0,top: 10),
                child: Column(
                  children: [
                        TextField(
                          controller: twitterController,
                          cursorColor: Colors.white,
                          decoration:InputDecoration(
                            icon: Icon(FontAwesomeIcons.twitter,color: Colors.white,size: 18,),
                            labelText: 'Twitter',
                            labelStyle: GoogleFonts.exo(
                                color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 1.0
                            ),
                            hintText: 'Enter your twitter ID',
                            hintStyle: TextStyle(
                                color: Colors.grey
                            ),

                          ),
                        ),
                    TextField(
                      controller: instagramController,
                      cursorColor: Colors.white,
                      decoration:InputDecoration(
                        icon: Icon(FontAwesomeIcons.instagram,color: Colors.white,size: 18,),
                        labelText: 'Instagram',
                        labelStyle: GoogleFonts.exo(
                            color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 1.0
                        ),
                        hintText: 'Enter your Instagram ID',
                        hintStyle: TextStyle(
                            color: Colors.grey
                        ),

                      ),
                    ),
                    TextField(
                      controller: discordController,
                      cursorColor: Colors.white,
                      decoration:InputDecoration(
                        icon: Icon(FontAwesomeIcons.discord,color: Colors.white,size: 18,),
                        labelText: 'Discord',
                        labelStyle: GoogleFonts.exo(
                            color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 1.0
                        ),
                        hintText: 'Enter your Discord ID',
                        hintStyle: TextStyle(
                            color: Colors.grey
                        ),

                      ),
                    ),
                    TextField(
                      controller: facebookController,
                      cursorColor: Colors.white,
                      decoration:InputDecoration(
                        icon: Icon(FontAwesomeIcons.facebookSquare,color: Colors.white,size: 18,),
                        labelText: 'Facebook',
                        labelStyle: GoogleFonts.exo(
                            color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 1.0
                        ),
                        hintText: 'Enter your Facebook ID',
                        hintStyle: TextStyle(
                            color: Colors.grey
                        ),

                      ),
                    ),
                    SizedBox(height: 8,),
                  ],
                ),
              ),
               SizedBox(height: 30,),
               Center(
                 child: RaisedButton.icon(
                   color: Color(0xFFFF4654),
                   onPressed:()async{
                     await saveDetails();
                     setState(() {

                     });
                   },
                   icon: Icon(FontAwesomeIcons.save,color: Colors.white,),
                   label: Text('Save Profile',style: TextStyle(
                     color: Colors.white
                   ),),
                 ),
               ),
            ],
          ),
        ),
      ),
    );

  }

  @override
  void initState() {
    currentUserProfile();
    loadPreferences();
    super.initState();
  }

}



