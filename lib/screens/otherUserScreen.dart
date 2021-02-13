import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwgplay/utils/user_auth.dart';

class otherUserProfile extends StatefulWidget {
  @override
  _otherUserProfileState createState() => _otherUserProfileState();
}

class _otherUserProfileState extends State<otherUserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ghost Profile'),
        centerTitle: true,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white70,
        ),
      ),
      backgroundColor: Color(0xFF2D3436),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,top: 10),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(authenticatedUser.imageURL),
              radius: 50,
            ),
            SizedBox(height: 20,),
            Text(authenticatedUser.name,
            style: TextStyle(
              fontSize: 22
            ),),
            SizedBox(height: 3,),
            Divider(height: 3,
              indent: 105,
              endIndent:105,
              color: Colors.white70,),
            SizedBox(height:5 ,),
            Expanded(
              child: RichText(
                text:TextSpan(
                text:'@vaibhavkarthik',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18
                ),
                    children:[
                      WidgetSpan(
                        child: Icon(FontAwesomeIcons.twitter,color: Colors.blue,size: 19,)
                      )
                    ]
              ),),
            ),
            Expanded(
              child: RichText(
                  text: TextSpan(
                  text: '@karthik0304',
                  style: TextStyle(
                        fontSize: 18,
                    color: Colors.white70,
              ),children: [
                WidgetSpan(
                  child: Icon(FontAwesomeIcons.instagram,color: Colors.pinkAccent,size: 19,),
                    alignment: PlaceholderAlignment.middle
                )
              ]
              )),
            ),
            Expanded(
              child: RichText(
                  text: TextSpan(
                      text: '@karthik0304',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),children: [
                    WidgetSpan(
                        child: Icon(FontAwesomeIcons.discord,color: Colors.indigo[500],size: 19,),
                        alignment: PlaceholderAlignment.middle
                    )
                  ]
                  )),
            ),
            SizedBox(height: 2,),
            Expanded(
              child: RichText(
                  text: TextSpan(
                      text: '@karthik0304',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),children: [
                    WidgetSpan(
                        child: Icon(FontAwesomeIcons.facebookSquare,color: Colors.blue,size: 19,),
                        alignment: PlaceholderAlignment.middle
                    )
                  ]
                  )),
            ),
            SizedBox(height: 15,),
            Text('Plays',textAlign: TextAlign.left,
            style: GoogleFonts.exo(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
            SizedBox(height: 10,),
            Text('Valorant, Warzone',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white
            ),),
            SizedBox(height: 25,),
            Text('Platforms',
                style:GoogleFonts.exo(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
            SizedBox(height: 10,),
            Text('PC,Xbox',
                style: TextStyle(
                fontSize: 18,
                  color: Colors.white
            ),),
            SizedBox(height: 20,),
            Text('Ghost Level',
                style:GoogleFonts.exo(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
            SizedBox(height: 10,),
            Text('1723',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
              ),),
            SizedBox(height: 40,),
            RaisedButton.icon(onPressed:(){},
            icon: Icon(FontAwesomeIcons.plus,color: Colors.lightGreen,),
            label: Text('Follow'),
            color: Colors.blueGrey[900],),
            SizedBox(height: 20,),
            RaisedButton.icon(onPressed:(){},
              icon: Icon(FontAwesomeIcons.exclamationCircle,color: Colors.red,),
              label: Text('Report'),
              color: Colors.blueGrey[900],),
          ],
        ),

      ),


    );
  }
}
