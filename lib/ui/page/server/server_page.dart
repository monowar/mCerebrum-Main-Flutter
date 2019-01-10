import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mcerebrum_main_flutter/ui/widgets/common_scaffold.dart';
import 'package:mcerebrum_main_flutter/ui/widgets/common_switch.dart';
import 'package:mcerebrum_main_flutter/utils/uidata.dart';

class ServerPage extends StatelessWidget {
  Size deviceSize;

  Widget profileHeader() => Container(
    height: deviceSize.height / 4,
    width: double.infinity,
    color: Colors.black,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: Colors.black,
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(width: 2.0, color: Colors.white)),
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: new ExactAssetImage('assets/images/cerebral_cortex.png'),
                ),
              ),
              Text(
                "Server: www.fortytwo.edu",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              Text(
                "User: nusrat",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    ),
  );

  Widget bodyData(BuildContext context) => SingleChildScrollView(
    child: Theme(
      data: ThemeData(fontFamily: UIData.ralewayFont),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          profileHeader(),
          //1
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Server Settings",
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
          Card(
            color: Colors.white,
            elevation: 2.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.file_download,
                    color: Colors.green,
                  ),
                  title: Text("Configuration Files"),
                  trailing: Icon(Icons.arrow_right),
                ),
                ListTile(
                  leading: Icon(
                    FontAwesomeIcons.sync,
                    color: Colors.lightBlueAccent,
                  ),
                  title: Text("Sync Data"),
                  trailing: Icon(Icons.arrow_right),
                ),
                ListTile(
                  leading: Icon(
                    FontAwesomeIcons.upload,
                    color: Colors.purple,
                  ),
                  title: Text("Uploader Settings"),
                  trailing: Icon(Icons.arrow_right),
                ),
                ListTile(
                  leading: Icon(
                    FontAwesomeIcons.signOutAlt,
                    color: Colors.orange,
                  ),
                  title: Text("Sign out"),
                  trailing: Icon(Icons.arrow_right),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        backgroundColor: Colors.black87,
        title: Text("Server Settings"),
        actions: <Widget>[
          SizedBox(
            width: 5.0,
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade300,
      body: bodyData(context),
    );
  }
}
