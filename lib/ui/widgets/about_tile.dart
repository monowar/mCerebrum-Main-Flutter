import 'package:flutter/material.dart';
import 'package:mcerebrum_main_flutter/utils/uidata.dart';

class MyAboutTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AboutListTile(
      applicationIcon: FlutterLogo(
        colors: Colors.yellow,
      ),
      icon: FlutterLogo(
        colors: Colors.yellow,
      ),
      aboutBoxChildren: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Text(
          "Developed By MD2K",
        ),
      ],
      applicationName: UIData.appName,
      applicationVersion: "3.0.0",
      applicationLegalese: "Apache License 2.0",
    );
  }
}
