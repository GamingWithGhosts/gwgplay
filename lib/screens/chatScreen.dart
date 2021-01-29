import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gwgplay/models/chatsModel.dart';
import 'package:gwgplay/models/groupUserModel.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _chatBubble(Message message, bool isMe, bool isSameUser) {
    if (isMe) {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          !isSameUser
              ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                message.time,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage(message.sender.imageUrl),
                ),
                
              ),
            ],
          )
              : Container(
            child: null,
          ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          !isSameUser
              ? Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage(message.sender.imageUrl),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                message.time,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ],
          )
              : Container(
            child: null,
          ),
        ],
      );
    }
  }

  _sendMessageArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 60,
      color: Colors.black,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.image,color: Colors.redAccent,),
            iconSize: 28,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message..',
                hoverColor: Colors.white
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.paperPlane,color: Colors.redAccent,),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int prevUserId;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
        centerTitle: true,
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                  //text: widget.user.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )),
              TextSpan(text: '\n'),
              // widget.user.isOnline ?
              TextSpan(
                text: 'Apex Predators',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              )

              //
            ],
          ),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(20),
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                final Message message = messages[index];
                final bool isMe = message.sender.id == currentUser.id;
                final bool isSameUser = prevUserId == message.sender.id;
                prevUserId = message.sender.id;
                return _chatBubble(message, isMe, isSameUser);
              },
            ),
          ),
          _sendMessageArea(),
        ],
      ),
    );
  }
}