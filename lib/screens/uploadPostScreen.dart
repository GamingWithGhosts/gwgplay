import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:file_picker/file_picker.dart';

class uploadPostScreen extends StatefulWidget {
  @override
  _uploadPostScreenState createState() => _uploadPostScreenState();
}

class _uploadPostScreenState extends State<uploadPostScreen> {


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _fileName;
  List<PlatformFile> _paths;
  String _directoryPath;
  String _extension;
  bool _loadingPath = false;
  bool _multiPick = false;

  void _openFileExplorerForImage() async {
    setState(() => _loadingPath = true);
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: _multiPick,
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '')?.split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      _fileName = _paths != null ? _paths.map((e) => e.name).toString() : '...';
    });
  }

  void _openFileExplorerForVideo() async {
    setState(() => _loadingPath = true);
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: FileType.video,
        allowMultiple: _multiPick,
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '')?.split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      _fileName = _paths != null ? _paths.map((e) => e.name).toString() : '...';
    });
  }
final captionController = new TextEditingController();
final messageController = new TextEditingController();
final hashtagController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text('Share your post',style: TextStyle(
            color: Colors.white
        ),),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10,20,10,10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                controller: captionController,
                cursorColor: Colors.white,
                decoration:InputDecoration(
                  icon: Icon(FontAwesomeIcons.pen,color: Colors.white,size: 16,),
                  labelText: 'Caption',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.redAccent,
                  ),
                  hintText: 'Add a caption',
                  hintStyle: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
              TextField(
                controller: messageController,
                cursorColor: Colors.white,
                decoration:InputDecoration(
                  icon: Icon(FontAwesomeIcons.pen,color: Colors.white,size: 16,),
                  labelText: 'Message',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.redAccent,
                  ),
                  hintText: 'Add a message',
                  hintStyle: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
              TextField(
                controller: hashtagController,
                cursorColor: Colors.white,
                decoration:InputDecoration(
                  icon: Icon(FontAwesomeIcons.pen,color: Colors.white,size: 16,),
                  labelText: '# Hashtag',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.redAccent,
                  ),
                  hintText: 'Add a hashtag',
                  hintStyle: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
              SizedBox(height:70 ,),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,10,10,10),
                child: Column(
                  children: [
                    RaisedButton.icon(
                      color: Colors.grey[800],
                      onPressed:(){
                        _openFileExplorerForImage();
                      },
                      icon: Icon(FontAwesomeIcons.camera,color: Colors.redAccent,),
                      label: Text('Upload Photo',style: TextStyle(
                          color: Colors.redAccent
                      ),),
                    ),
                    Text('or'),
                    RaisedButton.icon(
                      color: Colors.grey[800],
                      onPressed:(){
                        _openFileExplorerForVideo();
                      },
                      icon: Icon(FontAwesomeIcons.video,color: Colors.redAccent,),
                      label: Text('Upload Video',style: TextStyle(
                          color: Colors.redAccent
                      ),),
                    ),
                    SizedBox(height: 40,),
                    RaisedButton(
                      child: Text('Post',style: TextStyle(
                        color: Colors.redAccent
                      ),),
                      color: Colors.grey[800],
                      onPressed:(){
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


