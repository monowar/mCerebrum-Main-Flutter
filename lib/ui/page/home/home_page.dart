import 'package:flutter/material.dart';
import 'package:mcerebrum_main_flutter/ui/widgets/common_scaffold.dart';
import 'package:mcerebrum_main_flutter/ui/widgets/common_switch.dart';
import 'package:mcerebrum_main_flutter/utils/uidata.dart';

class HomePage extends StatelessWidget {
  Widget bodyData() => SingleChildScrollView(
    child: Theme(
      data: ThemeData(fontFamily: UIData.ralewayFont),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //3
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Sound",
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
                    Icons.volume_up,
                    color: Colors.green,
                  ),
                  title: Text("Sound Volume"),
                  trailing: Icon(Icons.arrow_right),
                ),
                ListTile(
                  leading: Icon(
                    Icons.phonelink_ring,
                    color: Colors.grey,
                  ),
                  title: Text("Ringtone"),
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
      appTitle: "Device Settings",
      showDrawer: false,
      showFAB: false,
      showBottomNav: false,
      backGroundColor: Colors.grey.shade300,
      bodyData: bodyData(),
    );
  }
}
