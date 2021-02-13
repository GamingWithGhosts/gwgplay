import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwgplay/models/notifications.dart';

class notificationsScreen extends StatefulWidget {

  @override
  _notificationsScreenState createState() => _notificationsScreenState();
}

class _notificationsScreenState extends State<notificationsScreen> {
  List<notificationContent> notification = [
    notificationContent(name: 'Ben Affleck',time: '08:03pm',content: 'Liked your post',dpUrl:'images/ben.jpg',status: true ),
    notificationContent(name: 'Chris Hemsworth',time: '07:25pm',content: 'Liked your post',dpUrl: 'images/chris1.jpg',status:true ),
    notificationContent(name: 'Leonardo DiCaprio',time: '06:45pm',content: 'Commented on your post',dpUrl: 'images/leo.jpeg',status:false ),
    notificationContent(name: 'Hugh Jackman',time: '05:15pm',content: 'Commented on your post',dpUrl: 'images/hugh.jpg',status:false),
    notificationContent(name: 'Chris Hemsworth',time: '04:05pm',content: 'Liked your post',dpUrl: 'images/chris1.jpg',status: true),
    notificationContent(name: 'Ben Affleck',time: '03:25pm',content: 'Liked your post',dpUrl: 'images/ben.jpg',status:true ),
    notificationContent(name: 'Leonardo DiCaprio',time: '02:11pm',content: 'Commented on your post',dpUrl: 'images/leo.jpeg',status:false ),
    notificationContent(name: 'Leonardo DiCaprio',time: '02:00pm',content: 'Liked your post',dpUrl: 'images/leo.jpeg',status:true ),
    notificationContent(name: 'Ben Affleck',time: '01:25pm',content: 'Liked post',dpUrl: 'images/ben.jpg',status: true),
    notificationContent(name: 'Chris Hemsworth',time: '12:14pm',content: 'Commented on your post',dpUrl: 'images/chris1.jpg',status:false ),
    notificationContent(name: 'Hugh Jackman',time: '11:53am',content: 'Commented on your post',dpUrl: 'images/hugh.jpg',status:false ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D3436),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text('Notifications',
        style: TextStyle(
            color: Colors.white,
        ),),
      ),
      body:
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 13),
              child: Column(
                children:notification.map((notify) => notifications(
                  notification: notify,
                )).toList()
              ),
            ),
          ),

    );
  }

}

class notifications extends StatelessWidget {
  final notificationContent notification ;
  notifications({this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFDFE6E9),
      margin:EdgeInsets.all(5) ,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:<Widget> [
             Row(
               children: [
                 CircleAvatar(
                   backgroundImage: AssetImage(notification.dpUrl),
                   radius: 14,
                 ),
                 SizedBox(width: 4,),
                 Expanded(
                   child: Text(
                      notification.name,
                      style: GoogleFonts.exo(color: Colors.black,fontWeight: FontWeight.bold)
                    ),
                 ),
                 Row(
                   children: [
                     Text(
                       notification.time,
                       style: TextStyle(
                           fontSize: 14.0,
                           color: Colors.black
                       ),
                     ),
                     Icon(FontAwesomeIcons.bell,color: Colors.black,size: 15,)
                   ],
                 ),
               ],
             ),
             SizedBox(height: 5,),
             Row(
               children: [
                 Expanded(
                   child: Text(
                      notification.content,
                      style: GoogleFonts.ptSans(color: Color(0xFFFF4654))
                    ),
                 ),
                 notification.status?Icon(FontAwesomeIcons.solidHeart,color: Colors.pink,):
                 Icon(FontAwesomeIcons.solidComment,color: Colors.indigo,),
               ],
             ),

          ],
        ),
      ) ,
    );
  }
}


