import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gwgplay/models/ghostGroupsInfo.dart';

class ghostGroupsProfile extends StatefulWidget {
  @override
  _ghostGroupsProfileState createState() => _ghostGroupsProfileState();
}

class _ghostGroupsProfileState extends State<ghostGroupsProfile> {

  List<ghostGroupsInfo> groupsInfo =[
    ghostGroupsInfo(groupIcon: 'images/gwgplay-logo.png',groupTitle: 'GWG-Play',message: 'Ben: Brb in 10 mins',time:'12:15pm'),
    ghostGroupsInfo(groupIcon: 'images/valo.png',groupTitle: 'Valorant Freaks',message: 'Leo: Game in 10 mins?',time:'11:50am'),
    ghostGroupsInfo(groupIcon: 'images/apexxx.png',groupTitle: 'Apex Predators',message: 'Hugh: Season 8 is out on Feb 2',time:'11:22am'),
    ghostGroupsInfo(groupIcon: 'images/rdr2.png',groupTitle: 'Red Dead 2 online',message: 'Chirs: Found and killed the Legendary bear and cooked it',time:'11:03am'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ghost Groups',
        style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: Icon(FontAwesomeIcons.plus,color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: SingleChildScrollView(
        child: Column(
          children:
            groupsInfo.map((info) => groups(
              groupsInfo: info,
            )).toList(),
        ),
      ),
    );
  }
}

class groups extends StatelessWidget {

  final ghostGroupsInfo groupsInfo;
  groups({this.groupsInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          tileColor: Colors.black,
          leading: CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage(groupsInfo.groupIcon),
          ),
          title: Row(
            children: [
              Expanded(child: Text(groupsInfo.groupTitle)),
              Text(groupsInfo.time)
            ],
          ),
          subtitle: Row(
            children: [
              Expanded(
                child: Text(groupsInfo.message,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                ),
              ),
            ],
          ),
          onTap: (){
            Navigator.pushNamed(context, "/chats");
          },
        ),
        Divider(height: 5,color: Colors.redAccent,)
      ],
    );
  }
}

