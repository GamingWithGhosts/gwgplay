import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwgplay/models/memberInfo.dart';

class teamDetails extends StatefulWidget {
  @override
  _teamDetailsState createState() => _teamDetailsState();
}

class _teamDetailsState extends State<teamDetails> {

  List<memberInfo> ghostInfo =[
    memberInfo(name: 'Karthik',alias: 'lifeline',desig: 'Leader'),
    memberInfo(name: 'Chirs',alias: 'caustic',desig: 'Co-Leader'),
    memberInfo(name: 'Leo',alias: 'rampart',desig: 'Member'),
    memberInfo(name: 'Stark',alias: 'loba',desig: 'Member'),
    memberInfo(name: 'Tyler',alias: 'octane',desig: 'Member'),
    memberInfo(name: 'Jake',alias: 'Gibby',desig: 'Member'),
    memberInfo(name: 'Karthik',alias: 'lifeline',desig: 'Leader'),
    memberInfo(name: 'Stark',alias: 'loba',desig: 'Member'),
    memberInfo(name: 'Leo',alias: 'rampart',desig: 'Member'),
    memberInfo(name: 'Jake',alias: 'Gibby',desig: 'Member'),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            color: Colors.white,
            itemBuilder: (BuildContext context){
              return Constants.choices.map((String choice){
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice,style: TextStyle(color: Colors.black),),
                );
              }).toList();
            },
          )
        ],
        backgroundColor: Colors.black87,
        title:Text('Apex NRG',
        style: TextStyle(
          color: Colors.white
        ),),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      backgroundColor: Color(0xFF2D3436),
      body: SingleChildScrollView(
        child: Card(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/apexxx.png'),
                  radius: 60,
                ),
              ),
              Text('Apex NRG',style: GoogleFonts.exo(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
              SizedBox(height: 5,),
              Text('Members:13',style: TextStyle(color: Colors.white),),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: RichText(text: TextSpan(
                  text: '9',
                  style: GoogleFonts.exo(fontWeight: FontWeight.bold,color: Colors.white),
                  children: [
                    WidgetSpan(
                      child: Icon(FontAwesomeIcons.trophy,color: Colors.yellow,)
                    )
                  ]
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children:
                    ghostInfo.map((info) => teamMembers(
                      ghostInfo: info,
                    )).toList()
                  ,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class Constants{
  static const String add = 'Add memebers';
  static const String search = 'Search player';

  static const List<String> choices = <String>[
    add,
    search
  ];
}

class Constants2{
  static const String remove= 'Kick-out';
  static const String rep = 'Report';

  static const List<String> choices2 = <String>[
    remove,
    rep
  ];
}

class teamMembers extends StatelessWidget {
  final memberInfo ghostInfo;
  teamMembers({this.ghostInfo});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 1),
          child: ListTile(
            tileColor: Color(0xFFDFE6E9),
            leading: CircleAvatar(
              backgroundImage: AssetImage(''),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Text(ghostInfo.name,style: GoogleFonts.exo(fontWeight: FontWeight.bold,color: Colors.black),)),
                SizedBox(width: 20,),
                PopupMenuButton<String>(
                  color: Colors.white,
                  itemBuilder: (BuildContext context){
                    return Constants2.choices2.map((String choice){
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice,style: TextStyle(color: Colors.black),),
                      );
                    }).toList();
                  },
                )
              ],
            ),
            subtitle:
                Row(
                  children: [
                    Expanded(child: Text(ghostInfo.alias,style:TextStyle(
                      color: Colors.black
                    ),)),
                    Text(ghostInfo.desig,
                      style: TextStyle(
                          color: Colors.redAccent
                      ),)
                  ],

                ),

          ),
        ),
      ],
    );
  }
}




