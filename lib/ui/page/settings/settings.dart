import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mcerebrum_main_flutter/ui/widgets/common_scaffold.dart';
import 'package:mcerebrum_main_flutter/ui/widgets/common_switch.dart';
import 'package:mcerebrum_main_flutter/utils/uidata.dart';

class Settings extends StatelessWidget {
  Widget bodyData(BuildContext context) => SingleChildScrollView(
        child: Theme(
          data: ThemeData(fontFamily: UIData.ralewayFont),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //1
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "User Settings",
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
                        Icons.wb_sunny,
                        color: Colors.orange,
                      ),
                      title: Text("Wakeup Time"),
                      trailing: Icon(Icons.arrow_right),
                    ),
                    ListTile(
                      leading: Icon(
                        FontAwesomeIcons.bed,
                        color: Colors.lightBlueAccent,
                      ),
                      title: Text("Sleep Time"),
                      trailing: Icon(Icons.arrow_right),
                    ),
                  ],
                ),
              ),

              //2
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "App Settings",
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
                        Icons.phone_android,
                        color: Colors.blue,
                      ),
                      title: Text("Phone Sensor"),
                      trailing: Icon(Icons.arrow_right),
                    ),
                    ListTile(
                        leading: Icon(
                          Icons.watch,
                          color: Colors.teal,
                        ),
                        title: Text("Smart Watch"),
                        trailing: Icon(Icons.arrow_right),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.bookmark_border,
                        color: Colors.amber,
                      ),
                      title: Text("Biomarkers"),
                      trailing: Icon(Icons.arrow_right),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.more_horiz,
                        color: Colors.grey,
                      ),
                      title: Text("More"),
                      trailing: Icon(Icons.arrow_right),
                    ),
                  ],
                ),
              ),

              //3
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "System",
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
                        Icons.language,
                        color: Colors.purple,
                      ),
                      title: Text("Server (Cerebral Cortex)"),
                      trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context,UIData.loginRoute);
                  },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.sd_storage,
                        color: Colors.orange,
                      ),
                      title: Text("Storage"),
                      trailing: Icon(Icons.arrow_right),

                    ),
                    ListTile(
                      leading: Icon(
                        Icons.lock,
                        color: Colors.red,
                      ),
                      title: Text("Privacy"),
                      trailing: Icon(Icons.arrow_right),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.update,
                        color: Colors.grey,
                      ),
                      title: Text("Check Updates"),
                      trailing: Icon(Icons.arrow_right),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appTitle: "Settings",
      showDrawer: true,
      showFAB: false,
      showBottomNav: false,
      backGroundColor: Colors.grey.shade300,
      bodyData: bodyData(context),
    );
  }
}
