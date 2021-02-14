import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';
class createTeam extends StatefulWidget {
  @override
  _createTeamState createState() => _createTeamState();
}

class _createTeamState extends State<createTeam> {
  final teamNameController = TextEditingController();
  final descriptionController = TextEditingController();

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D3436),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Create team',
        style: TextStyle(
          color: Colors.white
        ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: CircleAvatar(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: IconButton(
                      onPressed: _openFileExplorerForImage,
                      icon: Icon(
                        FontAwesomeIcons.edit,color: Colors.white,
                      ),
                    ),
                  ),
                  radius: 65,
                  backgroundImage: AssetImage(''),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5,bottom: 5),
              child: TextField(controller: teamNameController,
                style: TextStyle(
                    color: Colors.white
                ),
                cursorColor: Colors.white70,
                decoration:InputDecoration(
                  labelText: 'Team Name',
                  labelStyle: GoogleFonts.exo(fontWeight: FontWeight.bold,color: Colors.white),
                  hintText: 'Enter your Team Name',
                  hintStyle: TextStyle(
                      color: Colors.grey
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5,bottom: 5),
              child: TextField(controller: descriptionController,
                style: TextStyle(
                  color: Colors.white
                ),
                cursorColor: Colors.white70,
                decoration:InputDecoration(
                  labelText: 'Team Description',
                  labelStyle: GoogleFonts.exo(fontWeight: FontWeight.bold,color: Colors.white),
                  hintText: 'Enter your Team Description',
                  hintStyle: TextStyle(
                      color: Colors.grey
                  ),
                ),
              ),
            ),
            SizedBox(height: 70,),
            RaisedButton.icon(onPressed:(){},
              icon: Icon(FontAwesomeIcons.plus,color: Colors.white,),
              label: Text('Add members',
              style: TextStyle(color: Colors.white),),
              color: Colors.redAccent,),
            SizedBox(height: 20,),
            RaisedButton.icon(onPressed:(){},
              icon: Icon(FontAwesomeIcons.check,color: Colors.white,),
              label: Text('Create Team',style: TextStyle(
                color: Colors.white
              ),),
              color: Colors.redAccent,),
          ],
        ),
      ),
    );
  }
}
