import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwgplay/models/commentsModel.dart';
class commentsScreen extends StatefulWidget {
  @override
  _commentsScreenState createState() => _commentsScreenState();
}

class _commentsScreenState extends State<commentsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D3436),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text('Comments',
        style: TextStyle(
          color: Colors.white
        ),),
      ),
      body:  Stack(
        alignment: Alignment.bottomCenter,
          children:[
            SingleChildScrollView(
              child: Column(
              children: commentContent.map((content) => comments(
                commentContent: content,
              )).toList(),
              ),
            ),
            _typeCommentArea()
          ]
        ),
      );
  }
}

class comments extends StatelessWidget {
  final commentsModel commentContent;
  comments({this.commentContent});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: ListTile(
        contentPadding: EdgeInsets.only(bottom: 0,left: 2),
                tileColor: Color(0xFFDFE6E9),
                leading: CircleAvatar(
                  radius: 17,
                ),
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                          commentContent.username,
                        style: GoogleFonts.exo(fontWeight: FontWeight.bold,color: Color(0xFF333333))
                      ),
                    ),
                    Text(commentContent.time,
                        style:TextStyle(
                          color: Colors.black
                        )
                    ),
                    IconButton(
                        icon: Icon(FontAwesomeIcons.heart,
                          color: Colors.black,
                          size: 13,)
                    ),
                  ],
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child:Text(
                          commentContent.comment,
                        style: TextStyle(
                          color: Color(0xFF333333)
                        ),
                      ),
                    ),
                    IconButton(
                        icon: Icon(FontAwesomeIcons.reply,
                          color: Colors.black,
                          size: 13,)
                    ),

                  ],
                ),
            ),
    );
  }
}

_typeCommentArea() {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          height: 50,
          color: Colors.grey[900],
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: 'Type your comment...',
                      hoverColor: Colors.black
                  ),
                  textCapitalization: TextCapitalization.sentences,
                ),
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.paperPlane,color: Colors.redAccent,),
                iconSize: 25,
                color: Colors.grey,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


List<commentsModel> commentContent= [
  commentsModel(username: 'Karthik',comment: 'This is super cool',time:'3h'),
  commentsModel(username: 'Karthik',comment: 'This is super cool',time:'3h'),
  commentsModel(username: 'Karthik',comment: 'This is super cool',time:'3h'),
  commentsModel(username: 'Karthik',comment: 'This is super cool',time:'3h'),
  commentsModel(username: 'Karthik',comment: 'This is super cool',time:'3h'),
  commentsModel(username: 'Karthik',comment: 'This is super cool',time:'3h'),
  commentsModel(username: 'Karthik',comment: 'This is super cool',time:'3h'),
];




