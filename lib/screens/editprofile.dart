import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gwgplay/utils/preferences.dart';

class editProfile extends StatefulWidget {
  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  
  Future saveDetails()async{
    await preferences.setApplicationSavedInformation('games', gameController.text);
    await preferences.setApplicationSavedInformation('platforms', platformController.text);
    await preferences.setApplicationSavedInformation('twitter', twitterController.text);
    await preferences.setApplicationSavedInformation('discord', discordController.text);
    await preferences.setApplicationSavedInformation('instagram', instagramController.text);
    await preferences.setApplicationSavedInformation('facebook', facebookController.text);
    print( await preferences.getApplicationSavedInformation('games'));
  }

  final gameController = TextEditingController();
  final platformController = TextEditingController();
  final twitterController = TextEditingController();
  final discordController = TextEditingController();
  final instagramController = TextEditingController();
  final facebookController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Edit Your Ghost Profile',style: TextStyle(
          color: Colors.white70
        ),) ,
      iconTheme: IconThemeData(
        color: Colors.white70
      ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 20,left: 10),
        child: SingleChildScrollView(
          child: Column(
              children: <Widget>[
                TextField(
                  controller: gameController,
                  cursorColor: Colors.white70,
                  decoration:InputDecoration(
                    labelText: 'Your Games',
                    labelStyle: TextStyle(
                      fontSize: 19,
                      color: Colors.redAccent,
                    ),
                    hintText: 'Enter the games you play',
                    hintStyle: TextStyle(
                      color: Colors.grey
                    ),

                  ),
                ),
                SizedBox(height: 20,),
                TextField(controller: platformController,
                  cursorColor: Colors.white70,
                  decoration:InputDecoration(
                    labelText: 'Your Platforms',
                    labelStyle: TextStyle(
                      fontSize: 19,
                      color: Colors.redAccent,
                    ),
                    hintText: 'Enter the platform on which you play',
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),

                  ),
                ),
                SizedBox(height: 30,),
                Text('Enter your social media account handles'),
                Divider(indent: 50,endIndent: 50,height: 5,color: Colors.white70,),
                SizedBox(height: 10,),
                TextField(controller: twitterController,
                  cursorColor: Colors.white70,
                  decoration:InputDecoration(
                    icon: Icon(FontAwesomeIcons.twitter,color: Colors.blue,size: 20,),
                    labelText: 'Twitter',
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.redAccent,

                    ),
                    hintText: 'Enter your Twitter ID',
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),

                  ),
                ),
                SizedBox(height: 5,),
                TextField(controller: discordController,
                  cursorColor: Colors.white70,
                  decoration:InputDecoration(
                    icon: Icon(FontAwesomeIcons.discord,color: Colors.indigo[700],size: 20,),
                    labelText: 'Discord',
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.redAccent,
                    ),
                    hintText: 'Enter your Discord username',
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                TextField(controller: instagramController,
                  cursorColor: Colors.white70,
                  decoration:InputDecoration(
                    icon: Icon(FontAwesomeIcons.instagram,color: Colors.pinkAccent,size: 20,),
                    labelText: 'Instagram',
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.redAccent,
                    ),
                    hintText: 'Enter your Instagram ID',
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),

                  ),
                ),
                SizedBox(height: 10,),
                TextField(controller: facebookController,
                  cursorColor: Colors.white70,
                  decoration:InputDecoration(
                    icon: Icon(FontAwesomeIcons.facebookSquare,color: Colors.blue[900],size: 20,),
                    labelText: 'Facebook',
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.redAccent,
                    ),
                    hintText: 'Enter your Facebook ID',
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                  ),
                ),
                SizedBox(height:80,),
                RaisedButton.icon(onPressed: ()async{
                  await saveDetails();
                  Navigator.popAndPushNamed(context, "/currentUser");
                },
                    color: Colors.grey[800],
                    icon:Icon(FontAwesomeIcons.save,color: Colors.redAccent,),
                    label: Text('Save Details',
                      style: TextStyle(
                        color: Colors.redAccent
                    ),)),
              ],
          ),
        ),
      ),
    );
  }
}
