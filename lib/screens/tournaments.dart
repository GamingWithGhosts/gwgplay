import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwgplay/models/ongoingtournamentdetails.dart';
import 'package:gwgplay/models/upcomingtournamentdetails.dart';
class tournaments extends StatefulWidget {
  @override
  _tournamentsState createState() => _tournamentsState();
}

class _tournamentsState extends State<tournaments> {
  List<ongoingTournamentDetails> details = [
    ongoingTournamentDetails(details: '3K prize pool',game: 'Apex Legends'),
    ongoingTournamentDetails(details: '5K prize pool',game: 'Fortnite'),
    ongoingTournamentDetails(details: '5K prize pool',game: 'PUBG'),
  ];

  List<upcomingTournamentDetails> updetails = [
    upcomingTournamentDetails(details: '10k prize pool',game: 'Valorant',date:'24th Jan 2020' ),
    upcomingTournamentDetails(details: '5K prize pool',game: 'CSGO',date: '1st Feb 2020'),
    upcomingTournamentDetails(details: '2k prize pool',game: 'Minecraft',date:'17th Mar 2020'),
    upcomingTournamentDetails(details: '2k prize pool',game: 'Among US',date:'8th Apr 2020'),
    upcomingTournamentDetails(details: '2k prize pool',game: 'GTA 5 Online',date:'23rd Apr 2020'),

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color(0xFF2D3436),
          appBar: AppBar(
            backgroundColor: Colors.black87,
            bottom: TabBar(
              indicatorColor: Colors.redAccent,
              tabs: [
                Tab(text:'On-Going Tournaments',),
                Tab(text: 'Upcoming Tournaments',),
              ],
            ),
            title: Text('Tournaments'),
            centerTitle: true,
          ),
          body: TabBarView(
            children:[
              SingleChildScrollView(
                child: Column(
                  children: details.map((detail) =>onTourDetails(
                      details: detail,
                  )).toList(),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                children: updetails.map((detail) =>upTourDetails(
                    details: detail,
                  )).toList(),
    )
    ),
          ]
          ),
        ),
      ),
    );
  }
}
class onTourDetails extends StatelessWidget {

  final ongoingTournamentDetails details;
  onTourDetails({this.details});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFDFE6E9),
      margin:EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 10) ,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:<Widget> [
            Center(
              child: Text(
                details.game,
                style: GoogleFonts.exo(
                  color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20
                )
              ),
            ),
            SizedBox(height: 25.0,),
            Center(
              child: Text(
                details.details,
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black
                ),
              ),
            ),
            SizedBox(height: 25.0),
            FlatButton.icon(onPressed:(){},
              color: Color(0xFFFF4654),
              label: Text('View Details',style: TextStyle(
                color: Colors.white
              ),),
              icon: Icon(FontAwesomeIcons.infoCircle,color: Colors.white,),
            ),
            SizedBox(height: 0),
          ],
        ),
      ) ,
    );

  }
}

class upTourDetails extends StatelessWidget {
  final upcomingTournamentDetails details ;
  upTourDetails({this.details});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFDFE6E9),
      margin:EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 10) ,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:<Widget> [
            Center(
              child: Text(
                details.game,
                style: GoogleFonts.exo(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20
                ),
              ),
            ),
            SizedBox(height: 6.0,),
            Center(
              child: Text(
                details.details,
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              child: Text(
                details.date,
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black
                ),
              ),
            ),
            SizedBox(height: 15.0),
            FlatButton.icon(onPressed:(){},
              color: Color(0xFFFF4654),
              label: Text('Join Tournament',style: TextStyle(
                color: Colors.white
              ),),
              icon: Icon(FontAwesomeIcons.handshake,color: Colors.white,),
            ),
            SizedBox(height: 6.0),
          ],
        ),
      ) ,
    );
  }
}
